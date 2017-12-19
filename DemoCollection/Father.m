//
//  Father.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/18.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "Father.h"
#import <objc/NSObjCRuntime.h>
#import <objc/runtime.h>

@implementation Father


- (Class)class {
//    return object_getClass(self);
    return Father.class;
}

@end
