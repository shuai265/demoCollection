//
//  DCMRCObj.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/1.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCMRCObj.h"

@implementation DCMRCObj

- (void)MRCMethod {
    NSArray *arr = [[NSArray alloc] initWithObjects:@"string", nil];
    DLog(@"arr retainCount = %lu",(unsigned long)arr.retainCount);
    [arr retain];
    DLog(@"arr retainCount = %lu",(unsigned long)arr.retainCount);
    [arr release];
    DLog(@"arr retainCount = %lu",(unsigned long)arr.retainCount);
    [arr release];
    
    NSString *str = @"str";
    NSString *str2 = [str retain];
    NSString *str3 = [str copy];
    DLog(@"str = %p; str2 = %p; str3 = %p;",str,str2,str3);
    DLog(@"reatian count str = %d, str2 = %d, str3 = %d",str.retainCount,str2.retainCount,str3.retainCount);
    [str2 release];
    [str3 release];
    
    NSMutableString *strM = [NSMutableString stringWithFormat:@"str"];
    NSMutableString *strM2 = [strM retain];
    NSMutableString *strM3 = [strM mutableCopy];
    DLog(@"strM = %p; strM2 = %p; strM3 = %p;",strM,strM2,strM3);
    DLog(@"reatian count str = %d, str2 = %d, str3 = %d",strM.retainCount,strM2.retainCount,strM3.retainCount);
    [strM2 release];
    [strM3 release];
}

- (void)dealloc {
    [super dealloc];
}
@end
