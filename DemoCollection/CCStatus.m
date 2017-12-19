//
//  CCStatus.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "CCStatus.h"

@implementation CCStatus
- (CCStatus *)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
//        self.user = [[CCUser alloc] init];
//        self.user.Id = dic[@"userId"];
    }
    return self;
}

- (CCStatus *)initWithCreatedAt:(NSString *)createdAt source:(NSString *)source text:(NSString *)text user:(CCUser *)user{
    if (self = [super init]) {
        self.createdAt = createdAt;
        self.source = source;
        self.text = text;
        self.userId = user.Id;
        self.user = user;
    }
    return self;
}

- (CCStatus *)initWithCreatedAt:(NSString *)createdAt source:(NSString *)source text:(NSString *)text userId:(int)userId {
    if(self = [super init]){
        self.createdAt = createdAt;
        self.source = source;
        self.text = text;
        self.userId = [NSNumber numberWithInt:userId];
        CCUser *user = [[CCUser alloc]init];
        user.Id = [NSNumber numberWithInt:userId];
        self.user = user;
    }
    return self;
}

- (NSString *)source {
    return [NSString stringWithFormat:@"来自 %@",_source];
}

+ (CCStatus *)statusWithCreatedAt:(NSString *)createdAt source:(NSString *)source text:(NSString *)text user:(CCUser *)user {
    CCStatus *status = [[CCStatus alloc] initWithCreatedAt:createdAt source:source text:text user:user];
    return status;
}

+ (CCStatus *)statusWithCreatedAt:(NSString *)createdAt source:(NSString *)source text:(NSString *)text userId:(int)userId {
    CCStatus *status = [[CCStatus alloc] initWithCreatedAt:createdAt source:source text:text userId:userId];
    return status;
}

@end
