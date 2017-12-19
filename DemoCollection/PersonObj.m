//
//  PersonObj.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/16.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "PersonObj.h"

@implementation PersonObj

- (instancetype)initWithPid:(NSString *)pid name:(NSString *)name sex:(NSString *)sex age:(NSString *)age {
    if (self = [super init]) {
        self.pid = pid;
        self.name = name;
        self.sex = sex;
        self.age = age;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    PersonObj *person = [[PersonObj allocWithZone:zone] initWithPid:self.pid name:self.name sex:self.sex age:self.age];
    return person;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@:pid=%@,name=%@,sex=%@,age=%@",[super description],self.pid,self.name,self.sex,self.age];
}

@end
