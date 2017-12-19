//
//  CCStatus.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCUser.h"

@interface CCStatus : NSObject

#pragma mark - 属性
@property (nonatomic,strong) NSNumber *Id;//微博ID
@property (nonatomic,strong) NSNumber *userId;//UserID
@property (nonatomic,strong) CCUser *user;//发送用户
@property (nonatomic,copy) NSString *createdAt;//创建时间
@property (nonatomic,copy) NSString *source;//设备来源
@property (nonatomic,copy) NSString *text;//微博内容

#pragma mark - 动态方法
- (CCStatus *)initWithCreatedAt:(NSString *)createdAt source:(NSString *)source text:(NSString *)text user:(CCUser *)user;

- (CCStatus *)initWithCreatedAt:(NSString *)createdAt source:(NSString *)source text:(NSString *)text userId:(int)userId;

- (CCStatus *)initWithDictionary:(NSDictionary *)dic;

#pragma mark - 静态方法
+ (CCStatus *)statusWithCreatedAt:(NSString *)createdAt source:(NSString *)source text:(NSString *)text user:(CCUser *)user;

+ (CCStatus *)statusWithCreatedAt:(NSString *)createdAt source:(NSString *)source text:(NSString *)text userId:(int)userId;

@end
