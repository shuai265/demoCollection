//
//  CCDbManager.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "CCSingleton.h"

@interface CCDbManager : NSObject

singleton_interface(CCDbManager);

#pragma mark - 属性
#pragma mark 数据库引用，使用它进行数据库操作
@property (nonatomic) sqlite3 *database;

#pragma mark - 共有方法
/**
 * 打开数据库
 *
 * @param dbname 数据库名称
 */
- (void)openDb:(NSString *)dbname;

/**
 * 执行无返回值的sql
 *
 * @param sql sql语句
 */
- (void)executeNonQuery:(NSString *)sql;

/**
 * 执行有返回值的sql
 *
 * @param sql sql语句
 *
 * @return 查询结果
 */
- (NSArray *)executeQurey:(NSString *)sql;

@end
