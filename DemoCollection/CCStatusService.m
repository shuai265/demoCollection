//
//  CCStatusService.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "CCStatusService.h"
#import "CCStatus.h"
#import "CCDbManager.h"
#import "CCUserService.h"

@implementation CCStatusService

singleton_implementation(CCStatusService)

- (void)addStatus:(CCStatus *)status {
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO Status(source,createdAt,\"text\",userId) VALUES('%@','%@','%@','%@')",status.source,status.createdAt,status.text,status.userId];
    [[CCDbManager sharedCCDbManager] executeNonQuery:sql];
}

- (void)removeStatus:(CCStatus *)status {
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM Status WHERE Id='%@'",status.Id];
    [[CCDbManager sharedCCDbManager] executeNonQuery:sql];
}

- (void)modifyStatus:(CCStatus *)status {
    NSString *sql = [NSString stringWithFormat:@"UPDATE Status SET source='%@',createdAt='%@',\"text\"='%@',userId='%@' WHERE Id='%@'",status.source,status.createdAt,status.text,status.userId,status.Id];
    [[CCDbManager sharedCCDbManager] executeNonQuery:sql];
}

- (CCStatus *)getStatusById:(int)Id {
    CCStatus *status = [[CCStatus alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT Id, source, createdAt,\"text\",userId FROM Status WHERE Id='%i'",Id];
    NSArray *rows = [[CCDbManager sharedCCDbManager] executeQurey:sql];
    if (rows&&rows.count>0) {
        [status setValuesForKeysWithDictionary:rows[0]];
        status.user=[[CCUserService sharedCCUserService] getUserById:[(NSNumber *)rows[0][@"user"] intValue]];
    }
    return status;
}

- (NSArray *)getAllStatus {
    NSMutableArray *array = [NSMutableArray array];
    NSString *sql = @"SELECT Id,source,createdAt,\"text\",userId FROM Status ORDER BY Id";
    NSArray *rows = [[CCDbManager sharedCCDbManager] executeQurey:sql];
    for (NSDictionary *dic in rows) {
        CCStatus *status = [self getStatusById:[(NSNumber *)dic[@"Id"] intValue]];
        CCUser *user = [[CCUserService sharedCCUserService] getUserById:status.userId.intValue];
        status.user = user;
        [array addObject:status];
    }
    return array;
}

@end
