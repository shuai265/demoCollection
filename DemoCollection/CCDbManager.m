//
//  CCDbManager.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "CCDbManager.h"
#import <sqlite3.h>
#import "CCSingleton.h"
#import "CCAppConfig.h"


#ifndef cDatabaseName

#define cDatabaseName @"myDatabase.db"

#endif


@interface CCDbManager()

@end

@implementation CCDbManager

singleton_implementation(CCDbManager);

#pragma mark 重写初始化方法
- (instancetype)init{
    CCDbManager *manager;
    if((manager = [super init])) {
        [manager openDb:cDatabaseName];
    }
    return manager;
}

- (void)openDb:(NSString *)dbname {
    //取得数据库保存路径，通常保存沙盒Documents目录
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    DLog(@"%@",directory);
    
    NSString *filePath = [directory stringByAppendingPathComponent:dbname];
    
    if (SQLITE_OK == sqlite3_open(filePath.UTF8String, &_database)) {
        DLog(@"数据库打开成功");
    } else {
        DLog(@"数据库打开失败");
    }
}

- (void)executeNonQuery:(NSString *)sql {
    char *error;
    //单步执行sql，插入、修改、删除
    if (SQLITE_OK != sqlite3_exec(_database, sql.UTF8String, NULL, NULL, &error)) {
        DLog(@"执行SQL语句发生错误：%s",error);
    }
}

- (NSArray *)executeQurey:(NSString *)sql {
    NSMutableArray *rows = [NSMutableArray array];
    
    sqlite3_stmt *stmt;
    //检查语法正确性
    if (SQLITE_OK == sqlite3_prepare_v2(_database, sql.UTF8String, -1, &stmt, NULL)) {
        //单步执行sql语句
        while (SQLITE_ROW==sqlite3_step(stmt)) {
            int columnCount = sqlite3_column_count(stmt);
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            for (int i = 0; i<columnCount; i++) { //i：第i列
                const char *name = sqlite3_column_name(stmt, i); //列名
                const unsigned char *value = sqlite3_column_text(stmt,i);//某列的值
                dict[[NSString stringWithUTF8String:name]] = [NSString stringWithUTF8String:(const char *)value];
            }
            [rows addObject:dict];
        }
    }
    
    //释放句柄
    sqlite3_finalize(stmt);
    
    return rows;
}



@end
