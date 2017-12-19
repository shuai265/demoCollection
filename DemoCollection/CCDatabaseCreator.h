//
//  CCDatabaseCreator.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCDatabaseCreator : NSObject

+ (void)initDatabase;

+ (void)createUserTable;

+ (void)createStatusTable;

@end
