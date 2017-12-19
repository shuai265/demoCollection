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
}

- (void)dealloc {
    [super dealloc];
}
@end
