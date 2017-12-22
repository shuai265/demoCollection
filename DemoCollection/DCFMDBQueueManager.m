//
//  DCFMDBQueueManager.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/19.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCFMDBQueueManager.h"
#import <FMDB/FMDB.h>

@interface DCFMDBQueueManager ()
@property (nonatomic,strong) FMDatabaseQueue *database;
@end

@implementation DCFMDBQueueManager

- (void)openDb:(NSString *)dbname {
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    DLog(@"%@",directory);
    NSString *filePath = [directory stringByAppendingPathComponent:dbname];
    self.database = [FMDatabaseQueue databaseQueueWithPath:filePath];
}

- (void)executeNonQuery:(NSString *)sql {
    [self.database inDatabase:^(FMDatabase * _Nonnull db) {
        [db executeUpdate:sql];
    }];
}

- (NSArray *)executeQuery:(NSString *)sql {
    NSMutableArray *array = [NSMutableArray array];
    [self.database inDatabase:^(FMDatabase * _Nonnull db) {
        //执行查询sql
        FMResultSet *result = [db executeQuery:sql];
        while (result.next) {
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            for (int i = 0; i<result.columnCount; ++i) {
                dic[[result columnNameForIndex:i]] = [result stringForColumnIndex:i];
            }
            [array addObject:dic];
        }
    }];
    return array;
}

@end
