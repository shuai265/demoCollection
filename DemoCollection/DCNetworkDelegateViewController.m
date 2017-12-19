//
//  DCNetworkDelegateViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/18.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCNetworkDelegateViewController.h"

@interface DCNetworkDelegateViewController ()<NSURLConnectionDataDelegate> {
    NSMutableData *_data;
    UITextField *_textField;
    UIButton *_btn;
    UIProgressView *_progressView;
    UILabel *_label;
    long long _totalLength;
}

@end

@implementation DCNetworkDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self layoutUI];
}

#pragma mark - private method
#pragma mark UI layout
- (void)layoutUI {
    self.view.backgroundColor = [UIColor whiteColor];
    //地址栏
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, CC_SCREEN_WIDTH-20, 25)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.textColor = CCColor(0, 145, 1);
    _textField.text = @"简约至上：交互式设计四策略.epub";
    [self.view addSubview:_textField];
    
    _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(10, 100, CC_SCREEN_WIDTH-20, 24)];
    [self.view addSubview:_textField];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 130, CC_SCREEN_WIDTH, 25)];
    _label.textColor = CCColor(0, 146, 1);
    [self.view addSubview:_label];
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 500, CC_SCREEN_WIDTH-20, 25)];
    [_btn setTitle:@"Download" forState:UIControlStateNormal];
    [_btn setTitleColor:CCColor(0, 146, 1) forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(sendRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}

- (void)updateProgress {
    if (_data.length == _totalLength) {
        _label.text = @"下载完成";
    } else {
        _label.text = @"正在下载";
        [_progressView setProgress:(float)_data.length/_totalLength];
    }
}

- (void)sendRequest {
    NSString *urlStr = [NSString stringWithFormat:@"http://192.168.1.208/FileDownload.aspx?file=%@",_textField.text];

    NSCharacterSet *cSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:cSet];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0f];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

#pragma mark - 连接代理方法
#pragma mark 开始响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    DLog(@"receive response.");
    _data = [[NSMutableData alloc] init];
    _progressView.progress = 0;
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSDictionary *httpResponseHeaderFields = [httpResponse allHeaderFields];
    _totalLength = [[httpResponseHeaderFields objectForKey:@"Content-Length"] longLongValue];
}

#pragma mark 接收相应数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    DLog(@"receive data");
    [_data appendData:data];
    [self updateProgress];
}

#pragma mark 数据接收完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    DLog(@"loading finish");
    
    NSString *savePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    savePath = [savePath stringByAppendingPathComponent:_textField.text];
    [_data writeToFile:savePath atomically:YES];
    
    DLog(@"path:%@",savePath);
}

#pragma mark 请求失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    DLog(@"connection error, error detail = %@",error.localizedDescription);
}




@end
