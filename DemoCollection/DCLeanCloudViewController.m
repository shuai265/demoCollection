//
//  DCLeanCloudViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/22.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCLeanCloudViewController.h"
#import "DCLeanCloudUserViewController.h"

@interface DCLeanCloudViewController ()

@end

@implementation DCLeanCloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.listArr = @[@{@"itemTitle":@"用户登录",
                       @"class":DCLeanCloudUserViewController.class
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
