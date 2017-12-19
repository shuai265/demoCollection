//
//  DCKnowledgeInheritViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/18.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCKnowledgeSuperSelfViewController.h"
#import "Father.h"
#import "Children.h"
#import "Person.h"
#import "PersonChen.h"

@interface DCKnowledgeSuperSelfViewController ()

@end

@implementation DCKnowledgeSuperSelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Children *children = [[Children alloc] init];
    
    
    PersonChen *pChen = [[PersonChen alloc] init];
    pChen.lastName = @"chen";


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
