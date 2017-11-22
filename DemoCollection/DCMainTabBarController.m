//
//  DCMainTabBarController.m
//  DemoCollection
//
//  Created by liushuai on 2017/10/27.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCMainTabBarController.h"
#import "DCMainServiceNavController.h"
#import "DCMainServiceController.h"
#import "DCMainLibNavController.h"
#import "DCMainLibViewController.h"

@interface DCMainTabBarController ()

@end

@implementation DCMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    DCMainServiceNavController *serviceNav = [[DCMainServiceNavController alloc] initWithRootViewController:[[DCMainServiceController alloc] init]];
    
    DCMainLibNavController *libNav = [[DCMainLibNavController alloc] initWithRootViewController:[[DCMainLibViewController alloc] init]];
    
    self.viewControllers = @[serviceNav,libNav];
}


@end
