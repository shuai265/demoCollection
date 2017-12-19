//
//  PersonChen.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/18.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "PersonChen.h"

@implementation PersonChen

@synthesize lastName = _lastName;

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"子类 ： %s",__PRETTY_FUNCTION__);
    }
    return self;
}

- (void)setLastName:(NSString *)lastName {
    _lastName = @"陈";
    NSLog(@"类名与方法名:%s,在 %d 行,描述:%@",__PRETTY_FUNCTION__,__LINE__,@"子类的 setter 方法");
}

@end
