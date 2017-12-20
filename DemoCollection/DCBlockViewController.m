//
//  DCBlockViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCBlockViewController.h"
#import "DCBlockObject.h"

@interface DCBlockViewController ()

@end

@implementation DCBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self callBlcok];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)callBlcok {
    DCBlockObject *a = [[DCBlockObject alloc] init];
    [a setMyBlock:^(NSString *param) {
        DLog(@"set my block, get param:%@",param);
    }];
    
    [a finishWithBlock:^(NSString *param) {
        DLog(@"block:%@",param);
    }];
}


@end
