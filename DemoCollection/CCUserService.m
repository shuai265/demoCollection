
//
//  CCUserService.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "CCUserService.h"
#import "CCUser.h"
#import "CCDbManager.h"

@implementation CCUserService

singleton_implementation(CCUserService)

- (void)addUser:(CCUser *)user{
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO User (name,screenName,profileImageUrl,mbtype,city) VALUES('%@','%@','%@','%@','%@')",user.name,user.screenName,user.profileImageUrl,user.mbtype,user.city];
    [[CCDbManager sharedCCDbManager] executeNonQuery:sql];
}

- (void)removeUser:(CCUser *)user {
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM User WHERE Id='%@'",user.Id];
    [[CCDbManager sharedCCDbManager] executeNonQuery:sql];
}

-(void)removeUserByName:(NSString *)name {
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM USER WHERE name='%@'",name];
    [[CCDbManager sharedCCDbManager] executeNonQuery:sql];
}

- (void)modifyUser:(CCUser *)user {
    NSString *sql = [NSString stringWithFormat:@"UPDATE User SET name='%@',screenName='%@',profileImageUrl='%@',mbtype='%@',city='%@' WHERE Id='%@'",user.name,user.screenName,user.profileImageUrl,user.mbtype,user.city,user.Id];
    [[CCDbManager sharedCCDbManager] executeNonQuery:sql];
}

- (CCUser *)getUserById:(int)Id {
    CCUser *user = [[CCUser alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT name,screenName,profileImageUrl,mbtype,city FROM User WHERE Id='%i'",Id];
    NSArray *rows = [[CCDbManager sharedCCDbManager] executeQurey:sql];
    if (rows && rows.count>0) {
        [user setValuesForKeysWithDictionary:rows[0]];
    }
    return user;
}

-(CCUser *)getUserByName:(NSString *)name {
    CCUser *user = [[CCUser alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT name,screenName,profileImageUrl,mbtype,city FROM User WHERE name='%@'",name];
    NSArray *rows = [[CCDbManager sharedCCDbManager] executeQurey:sql];
    if (rows && rows.count>0) {
        [user setValuesForKeysWithDictionary:rows[0]];
    }
    return user;
}

@end
