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
#import "DCMainCommonlyNavController.h"
#import "DCMainCommonViewController.h"
#import "DCKnowledgeNavController.h"
#import "DCKnowledgeViewController.h"


@interface DCMainTabBarController ()

@end

@implementation DCMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    DCMainServiceNavController *serviceNav = [[DCMainServiceNavController alloc] initWithRootViewController:[[DCMainServiceController alloc] init]];
    
    DCMainLibNavController *libNav = [[DCMainLibNavController alloc] initWithRootViewController:[[DCMainLibViewController alloc] init]];
    
    DCMainCommonlyNavController *commonNav = [[DCMainCommonlyNavController alloc] initWithRootViewController:[[DCMainCommonViewController alloc] init]];
    
    DCKnowledgeNavController *knowledgeNav = [[DCKnowledgeNavController alloc] initWithRootViewController:[[DCKnowledgeViewController alloc] init]];
    
    self.viewControllers = @[serviceNav,libNav,commonNav,knowledgeNav];
}


@end
