//
//  DCTypeConvertViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/19.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCTypeConvertViewController.h"

@interface DCTypeConvertViewController ()

@end

@implementation DCTypeConvertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dict = @{@"key":@"value"};
    DLog(@"dict str is:%@",[self stringFromDict:dict]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)stringFromDict:(NSDictionary *)dict {
    return [NSString stringWithFormat:@"%@",dict];
}

@end
