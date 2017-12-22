//
//  DCParseJSONSerializationViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/15.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCParseJSONViewController.h"
#import <SBJson5/SBJson5.h>

@interface DCParseJSONViewController ()
@property (weak, nonatomic) IBOutlet UITextView *parseTextView;
@end

@implementation DCParseJSONViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.parseTextView.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)jsonSerilizationParse:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.douban.com/v2/book/1220562"]];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error && data) {
                NSError *parseErr = nil;
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&parseErr];
                NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                DLog(@"dict = %@, str = %@",dict,str);
            }
        }];
        
        [task resume];
    });
}


- (IBAction)jsonSBJSONParse:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/book/1220562"];
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url];
        if (!error) {
            SBJson5ValueBlock block = ^(id v, BOOL *stop) {
                BOOL isArray = [v isKindOfClass:[NSArray class]];
                NSLog(@"Found: %@", isArray ? @"Array" : @"Object");
                NSDictionary *dic = v;
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.parseTextView.text = [NSString stringWithFormat:@"summary = %@",dic[@"summary"]];
                });
            };
            
            SBJson5ErrorBlock eh = ^(NSError* err) {
                NSLog(@"OOPS: %@", err);
                exit(1);
            };
            
            SBJson5Parser *parser = [SBJson5Parser parserWithBlock:block errorHandler:eh];
            [parser parse:data];
        }
    });
}


- (IBAction)yyKitParse:(id)sender{
    self.parseTextView.text = @"";
}

- (IBAction)cleanAction:(id)sender {
    self.parseTextView.text = @"";
}

@end
