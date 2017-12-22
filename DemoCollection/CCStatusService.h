//
//  CCStatusService.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSingleton.h"
@class CCStatus;


@interface CCStatusService : NSObject
singleton_interface(CCStatusService);

- (void)addStatus:(CCStatus *)status;

- (void)removeStatus:(CCStatus *)status;

- (void)modifyStatus:(CCStatus *)status;

- (CCStatus *)getStatusById:(int)Id;

- (NSArray *)getAllStatus;


@end

