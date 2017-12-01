//
//  DCMainServiceController.m
//  DemoCollection
//
//  Created by liushuai on 2017/10/27.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCMainServiceController.h"
#import "DCMapViewController.h"

@interface DCMainServiceController ()
@end

@implementation DCMainServiceController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.listArr = @[@{@"itemTitle":@"地图",
                       @"class":DCMapViewController.class
                       },
                     @{@"itemTitle":@"分享"},
                     @{@"itemTitle":@"支付"},
                     @{@"itemTitle":@"推送"},
                     @{@"itemTitle":@"蒲公英"},
                     @{@"itemTitle":@"leanCloud"},
                     @{@"itemTitle":@"讯飞语音"}
                     ];
    
}


@end
