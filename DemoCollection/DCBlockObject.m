//
//  DCBlockObject.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCBlockObject.h"

@implementation DCBlockObject


- (void)finishWithBlock:(BlockName)block {
    //...
    block(@"result str");
    if (_myBlock) {
        DLog(@"call my block: set param");
        _myBlock(@"my block param");
    }
}

- (void)setMyBlock:(BlockName)myBlock {
    _myBlock = [myBlock copy];
}


@end
