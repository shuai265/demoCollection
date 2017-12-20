//
//  DCBlockObject.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BlockName)(NSString *param);

@interface DCBlockObject : NSObject

- (void)finishWithBlock:(BlockName)block;

@property (nonatomic,copy) BlockName myBlock;

@end
