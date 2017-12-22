//
//  Person.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/18.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"父类 ： %s",__PRETTY_FUNCTION__);
    }
    return self;
}

- (void)setLastName:(NSString *)lastName {
    _lastName = @"炎黄";
    NSLog(@"类名与方法名：%s, 第 %d 行，描述：%@",__PRETTY_FUNCTION__,__LINE__,@"父类 setter 方法");
}

@end
