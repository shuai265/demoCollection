//
//  DCSignletonManager.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCSignletonManager.h"

@implementation DCSignletonManager

+ (instancetype)sharedManager {
    static DCSignletonManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[DCSignletonManager alloc] init];
    });
    return sharedManager;
}

@end
