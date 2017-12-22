//
//  DCEqualCollectionViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/20.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCEqualViewController.h"
#import "DCEqualObject.h"

@interface DCEqualViewController ()

@end

@implementation DCEqualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    DCEqualObject *o1 = [[DCEqualObject alloc]initWithFirstName:@"a" lastName:@"bc"];
    DCEqualObject *o2 = [[DCEqualObject alloc]initWithFirstName:@"a" lastName:@"bc"];
    DCEqualObject *o3 = [[DCEqualObject alloc]initWithFirstName:@"ab" lastName:@"c"];
    DCEqualObject *o4 = [[DCEqualObject alloc]initWithFirstName:@"1" lastName:@"23"];
    
    NSLog(@"o1 %@ o2,o1.hash = %d,o2.hash = %d",[o1 isEqual:o2]?@"==":@"!=",o1.hash,o2.hash);
    NSLog(@"o1 %@ o3,o1.hash = %d,o3.hash = %d",[o1 isEqual:o3]?@"==":@"!=",o1.hash,o3.hash);
    NSLog(@"o1 %@ o4,o1.hash = %d,o4.hash = %d",[o1 isEqual:o4]?@"==":@"!=",o1.hash,o4.hash);
    
    
    NSString *shortUrl =  [o1 leetCode];
    [o1 decodeShortUrl:shortUrl];
    
}


@end
