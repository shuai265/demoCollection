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
    //dispatch_once_t 为long类型
    static dispatch_once_t onceToken;
    NSLog(@"Before token onceToken = %ld",onceToken);
//    onceToken = 0; // 声明默认值为 0，表示未执行，如在此处将值手动改为0，下方代码每次都会执行
//    onceToken = -1; // 执行后值变为 -1，表示已执行
    dispatch_once(&onceToken, ^{
        sharedManager = [[DCSignletonManager alloc] init];
        NSLog(@"After token onceToken = %ld",onceToken);
    });
    return sharedManager;
}

@end
