//
//  DCCocoaViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/2.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCCocoaViewController.h"
#import "DCWebListViewController.h"

@interface DCCocoaViewController ()

@end

@implementation DCCocoaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.navigationItem.title = @"Cocoa";
    self.listArr = @[
                     @{@"itemTitle":@"WebView",
                       @"class":DCWebListViewController.class},
                     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end