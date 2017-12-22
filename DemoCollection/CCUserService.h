//
//  CCUserService.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/14.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSingleton.h"
#import "CCUser.h"

@interface CCUserService : NSObject

singleton_interface(CCUserService)

- (void)addUser:(CCUser *)user;

/**
 * 删除用户
 *
 * @param user 用户对象
 */
- (void)removeUser:(CCUser *)user;

- (void)removeUserByName:(NSString *)name;

- (void)modifyUser:(CCUser *)user;

- (CCUser *)getUserById:(int)Id;

- (CCUser *)getUserByName:(NSString *)name;

@end
