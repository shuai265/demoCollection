//
//  DCMainCommonViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/1.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCMainCommonViewController.h"
#import "DCLazyTableViewController.h"
#import "DCDBMainTableViewController.h"

@interface DCMainCommonViewController ()

@end

@implementation DCMainCommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"常用模块";
    
    self.listArr = @[@{@"itemTitle":@"懒加载图片",
                       @"class":DCLazyTableViewController.class
                       },
                     @{@"itemTitle":@"启动页",
//                       @"class":DCMapViewController.class
                       },
                     @{@"itemTitle":@"广告页",
//                       @"class":DCMapViewController.class
                       },
                     @{@"itemTitle":@"轮播图",
//                       @"class":DCMapViewController.class
                       },
                     @{@"itemTitle":@"数据库",
                       @"class":DCDBMainTableViewController.class
                       },
                     @{@"itemTitle":@"地图",
//                       @"class":DCMapViewController.class
                       }
                     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
