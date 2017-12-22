//
//  DCNetworkViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/18.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCNetworkViewController.h"
#import "DCNetworkDelegateViewController.h"
#import "DCNetworkSimpleViewController.h"
#import "DCNetworkURLSessionDataViewController.h"

@interface DCNetworkViewController ()

@end

@implementation DCNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listArr = @[
                     @{@"itemTitle":@"使用代理方法",
                       @"detail":@"NSURLRequest",
                       @"class":DCNetworkDelegateViewController.class
                       },
                     @{@"itemTitle":@"简化请求方法",
                       @"detail":@"NSURLRequest",
                       @"class":DCNetworkSimpleViewController.class
                       },
                     @{@"itemTitle":@"NSURLSession",
                       @"detail":@"",
                       @"class":DCNetworkURLSessionDataViewController.class
                         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
