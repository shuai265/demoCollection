//
//  DCNetworkURLSessionDataViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/19.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCNetworkURLSessionDataViewController.h"

@interface DCNetworkURLSessionDataViewController ()

@end

@implementation DCNetworkURLSessionDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)layoutUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btnLoadJson  = [self btnWithTitle:@"loadJsonData" frame:CGRectMake(100, 200, 100, 30) action:@selector(loadJsonData)];
    

}

- (UIButton *)btnWithTitle:(NSString *)title frame:(CGRect)frame action:(SEL)selector {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setFrame:frame];
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    return btn;
}

- (void)loadJsonData {
    // url
    NSString *str = [NSString stringWithFormat:@"https://api.douban.com/v2/book/1220562"];
    NSCharacterSet *cSet =  [NSCharacterSet URLQueryAllowedCharacterSet];
    str = [str stringByAddingPercentEncodingWithAllowedCharacters:cSet];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            DLog(@"%@",dict);
        } else {
            DLog(@"download error");
        }
    }];
    
    [dataTask resume];
}


#pragma mark - 文件上传
#pragma mark mine types
- (NSString *)getMIMETypes:(NSString *)fileName {
    return @"image/jpg";
}

#pragma mark data body
- (NSData *)getHttpBody:(NSString *)fileName {
    NSString *boundary = @"cc";
    NSMutableData *dataM = [NSMutableData data];
    NSString *strTop = [NSString stringWithFormat:@"--%@\nContent-Disposition: form-data; name=\"file1\"; filename=\"%@\"\nContent-Type: %@\n\n",boundary,fileName,[self getMIMETypes:fileName]];
    NSString *strBottom = [NSString stringWithFormat:@"\n--%@--",boundary];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    [dataM appendData:[strTop dataUsingEncoding:NSUTF8StringEncoding]];
    [dataM appendData:fileData];
    [dataM appendData:[strBottom dataUsingEncoding:NSUTF8StringEncoding]];
    
    return dataM;
}

#pragma mark 文件上传
- (void)uploadFile {
    NSString *fileName = @"pic.jpg";
    
    //url
    NSString *urlStr = @"";
    NSCharacterSet *cSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:cSet];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    //request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";

    //data
    NSData *data = [self getHttpBody:fileName];
    request.HTTPBody = data;
    
    //request Content-Length & Content-Type
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)data.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@",@"cc"] forHTTPHeaderField:@"Content-Type"];
    
    //创建回话
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:data completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSString *dataStr = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
            DLog(@"%@",dataStr);
        } else {
            DLog(@"error:%@",error.localizedDescription);
        }
    }];
    
    [uploadTask resume];
}

#pragma mark - 文件下载
- (void)downloadFile {
    //url
    NSString *fileName = @"";
    NSString *urlStr = [NSString stringWithFormat:@""];
    NSCharacterSet *cSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:cSet];
    
    //request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlStr];
    
    //session
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSError *saveError;
            NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
            NSString *savePath = [cachePath stringByAppendingPathComponent:fileName];
            DLog(@"savePath = %@",savePath);
            NSURL *saveUrl = [NSURL fileURLWithPath:savePath];
            [[NSFileManager defaultManager] copyItemAtURL:location toURL:saveUrl error:&saveError];
            if (!saveError) {
                DLog(@"save success.");
            } else {
                DLog(@"error : %@",saveError.localizedDescription);
            }
        } else {
            DLog(@"error is %@",error.localizedDescription);
        }
    }];
    
    [downloadTask resume];
}

@end
