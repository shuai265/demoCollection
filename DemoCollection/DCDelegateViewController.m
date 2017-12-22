
//
//  DCDelegateViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCDelegateViewController.h"
#import "DCDelegateObject.h"

@interface DCDelegateViewController ()<DCDelegateObjectDelegate>

@end

@implementation DCDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DCDelegateObject *dObj = [[DCDelegateObject alloc] init];
    dObj.delegate = self;
    [dObj startSomething];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark DCDelegateObjectDelegate method
- (void)DCDelegateObjectFinishSomething:(NSString *)result {
    DLog(@"delegate method get param: %@",result);
}

@end
