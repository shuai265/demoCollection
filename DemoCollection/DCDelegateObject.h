//
//  DCDelegateObject.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DCDelegateObject;

@protocol DCDelegateObjectDelegate<NSObject>

- (void)DCDelegateObjectFinishSomething:(NSString *)result;

@end


@interface DCDelegateObject : NSObject

@property (nonatomic,weak) id<DCDelegateObjectDelegate> delegate;

- (void)startSomething;

@end
