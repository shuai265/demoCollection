//
//  DCMFDBManager.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/19.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCMFDBManager.h"
#import <FMDB/FMDB.h>

@interface DCMFDBManager()
@property (nonatomic,strong) FMDatabase *database;
@end

@implementation DCMFDBManager

- (void)openDb:(NSString *)dbname {
    //get db path, usualy documents
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    DLog(@"%@",directory);
    NSString *filePath = [directory stringByAppendingPathComponent:dbname];
    //create FMDatabase object
    self.database = [FMDatabase databaseWithPath:filePath];
    //open database
    if ([self.database open]) {
        DLog(@"open database success!");
    } else {
        DLog(@"open database failed!");
    }
}

- (void)executeNonQuery:(NSString *)sql {
    if(![self.database executeUpdate:sql]) {
        NSLog(@"执行SQL语句过程中发生错误");
    }
}

- (NSArray *)executeQuery:(NSString *)sql {
    NSMutableArray *array = [NSMutableArray array];
    //执行查询sql语句
    FMResultSet *result = [self.database executeQuery:sql];
    while (result.next) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        for (int i=0; i<result.columnCount; ++i) {
            dic[[result columnNameForIndex:i]] = [result stringForColumnIndex:i];
        }
        [array addObject:dic];
    }
    return array;
}

@end
