//
//  CCUser.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "CCUser.h"

@implementation CCUser

- (CCUser *)initWithName:(NSString *)name screenName:(NSString *)screenName profileImageUrl:(NSString *)profileImageUrl mbtype:(NSString *)mbtype city:(NSString *)city {
    if (self = [super init]) {
        self.name = name;
        self.screenName = screenName;
        self.profileImageUrl = profileImageUrl;
        self.mbtype = mbtype;
        self.city = city;
    }
    return self;
}

- (CCUser *)initWithDictionary:(NSString *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (CCUser *)userWithName:(NSString *)name screenName:(NSString *)screenName profileImageUrl:(NSString *)profileImageUrl mbtype:(NSString *)mbtype city:(NSString *)city {
    CCUser *user = [[CCUser alloc] initWithName:name screenName:screenName profileImageUrl:profileImageUrl mbtype:mbtype city:city];
    return user;
}

@end
