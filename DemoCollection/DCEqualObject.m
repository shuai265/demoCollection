//
//  DCEqualObject.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCEqualObject.h"

@implementation DCEqualObject

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if ([self class] != [object class]) {
        return NO;
    }
    
    DCEqualObject *otherObj = (DCEqualObject *)object;
    if (![self.firstName isEqualToString:otherObj.firstName]) {
        return NO;
    }
    
    if (![self.lastName isEqualToString:otherObj.lastName]) {
        return NO;
    }
    return YES;
}

- (NSUInteger)hash {
    NSString *stringToHash = [NSString stringWithFormat:@"%@%@",self.firstName,self.lastName];
    return [stringToHash hash];
    
//    NSUInteger hash1 = [self.firstName hash];
//    NSUInteger hash2 = [self.lastName hash];
//    return hash1^hash2;
}
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    if (self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
    }
    return self;
}

- (NSString *)leetCode {
    NSString *str = @"https://leetcode.com/problems/design-tinyurl";
    NSString *s = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSUInteger hash = [str hash];
    DLog(@"hash = %lu",(unsigned long)hash);
    NSMutableString *result = [NSMutableString string];
    while (hash>0) {
        [result insertString:[s substringWithRange:NSMakeRange(hash%62, 1)] atIndex:0];
        hash /= 62;
    }
    DLog(@"result = %@",result); //qlhX1zBAm7V
    return result;
}

- (void)decodeShortUrl:(NSString *)shortUrl {
    NSString *s = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSUInteger hash = 0;
    for (int i = 0; i<shortUrl.length; i++) {
        NSString *c = [shortUrl substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [s rangeOfString:c];
        hash = hash*62+range.location;
    }
    DLog(@"hash = %lu",(unsigned long)hash);
}

@end
