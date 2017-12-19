//
//  Children.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/18.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "Children.h"

@implementation Children

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"类名与方法名：%s, 在第 %d 行, 描述:%@",__PRETTY_FUNCTION__ ,__LINE__,NSStringFromClass([self class]));
        NSLog(@"类名与方法名：%s, 在第 %d 行, 描述:%@",__PRETTY_FUNCTION__ ,__LINE__,NSStringFromClass([super class]));
    }
    return self;
}


@end
