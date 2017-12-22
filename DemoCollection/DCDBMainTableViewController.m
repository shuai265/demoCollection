//
//  DCDBMainTableViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/12.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCDBMainTableViewController.h"
#import "DCDBSQLiteViewController.h"
#import "DCCoreDataViewController.h"

@interface DCDBMainTableViewController ()

@end

@implementation DCDBMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listArr = @[@{@"itemTitle":@"SQLite",
                       @"class":DCDBSQLiteViewController.class
                       },
                     @{@"itemTitle":@"SQLite",
                       @"class":DCCoreDataViewController.class
                       }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

