//
//  PersonObj.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/16.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonObj : NSObject<NSCopying>
@property (nonatomic,copy) NSString *pid;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *age;

- (instancetype)initWithPid:(NSString *)pid name:(NSString *)name sex:(NSString *)sex age:(NSString *)age;
@end
