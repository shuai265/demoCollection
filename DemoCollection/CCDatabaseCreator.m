//
//  CCDatabaseCreator.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "CCDatabaseCreator.h"
#import "CCDbManager.h"

@implementation CCDatabaseCreator

+ (void)initDatabase {
    NSString *key = @"ISCreateDb";
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    if ([[defaults valueForKey:key] intValue] != 1) {
        [self createUserTable];
        [self createStatusTable];
        [defaults setValue:@1 forKey:key];
    }
}

+ (void)createUserTable {
    NSString *sql = @"CREATE TABLE User (Id integer PRIMARY KEY AUTOINCREMENT,name text,screenName text, profileImageUrl text, mbtype text, city text)";
    [[CCDbManager sharedCCDbManager] executeNonQuery:sql];
    DLog(@"创建User表");
}

+ (void)createStatusTable {
    NSString *sql = @"CREATE TABLE Status (Id integer PRIMARY KEY AUTOINCREMENT,source text, createdAt date,\"text\" text, userId integer REFERENCES User (Id))";
    [[CCDbManager sharedCCDbManager] executeNonQuery:sql];
    DLog(@"创建Status表");
}

@end
