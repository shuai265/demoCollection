//
//  CCUser.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CCUser : NSObject

#pragma mark 编号
@property (nonnull,strong) NSNumber *Id;

#pragma mark 用户名
@property (nonatomic,copy) NSString * name;

#pragma mark 用户昵称
@property (nonatomic,copy) NSString *screenName;

#pragma mark 头像
@property (nonatomic,copy) NSString *profileImageUrl;

#pragma mark 会员类型
@property (nonatomic,copy) NSString *mbtype;

#pragma mark 城市
@property (nonatomic,copy) NSString *city;

#pragma mark - 动态方法
- (CCUser *)initWithName:(NSString *)name screenName:(NSString *)screenName profileImageUrl:(NSString *)profileImageUrl mbtype:(NSString *)mbtype city:(NSString *)city;

- (CCUser *)initWithDictionary:(NSString *)dic;


#pragma mark - 静态方法
+ (CCUser *)userWithName:(NSString *)name screenName:(NSString *)screenName profileImageUrl:(NSString *)profileImageUrl mbtype:(NSString *)mbtype city:(NSString *)city;

@end
