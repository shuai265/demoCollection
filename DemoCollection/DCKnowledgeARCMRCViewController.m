
//
//  DCKnowledgeARCMRCViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/1.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCKnowledgeARCMRCViewController.h"
#import "DCARCObj.h"
#import "DCMRCObj.h"

@interface DCKnowledgeARCMRCViewController ()

@end

@implementation DCKnowledgeARCMRCViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)callMRCMethod:(id)sender {
    DCMRCObj *mrc = [[DCMRCObj alloc]init];
    [mrc MRCMethod];
}



@end
