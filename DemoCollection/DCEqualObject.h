//
//  DCEqualObject.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCEqualObject : NSObject

@property (nonatomic,copy) NSString *firstName;

@property (nonatomic,copy) NSString *lastName;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;

- (NSString *)leetCode;

- (void)decodeShortUrl:(NSString *)shortUrl;

@end

