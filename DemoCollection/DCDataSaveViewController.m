//
//  DCDataSaveViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCDataSaveViewController.h"
#import "DCUserDefaultsViewController.h"

@interface DCDataSaveViewController ()

@end

@implementation DCDataSaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listArr = @[
                     @{@"itemTitle":@"偏好设置",
                       @"class":DCUserDefaultsViewController.class
                       }
                     ];
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