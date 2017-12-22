//
//  DCFMDBQueueManager.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/19.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DCFMDBQueueManager;

@protocol DCFMDBQueurManager <NSObject>

@end

typedef void(^BlockName)(NSString *str,NSArray *arr);

@interface DCFMDBQueueManager : NSObject

- (void)finishWithBlcok:(BlockName)block;

@end
