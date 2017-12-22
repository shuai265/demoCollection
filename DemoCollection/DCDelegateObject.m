//
//  DCDelegateObject.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCDelegateObject.h"

@implementation DCDelegateObject

- (void)startSomething {
    if ([self.delegate respondsToSelector:@selector(DCDelegateObjectFinishSomething:)]) {
        [self.delegate DCDelegateObjectFinishSomething:@"result str param"];
    }
}

@end
