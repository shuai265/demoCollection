//
//  DCKnowledgeViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/1.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCKnowledgeViewController.h"
#import "DCTypeConvertViewController.h"
#import "DCKnowledgeSuperSelfViewController.h"
#import "DCKnowledgeARCMRCViewController.h"
#import "DCKnowledgeCopyTableViewController.h"

@interface DCKnowledgeViewController ()
//@property (nonatomic,copy) NSArray *list;
@end

@implementation DCKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"知识点";
    
    self.listArr = @[@{@"itemTitle":@"Type Convert",
                       @"class":DCTypeConvertViewController.class},
                  @{@"itemTitle":@"Super & Self",
                    @"class":DCKnowledgeSuperSelfViewController.class},
                  @{@"itemTitle":@"Copy",
                    @"class":DCKnowledgeCopyTableViewController.class},
                  @{@"itemTitle":@"ARC & MRC",
                    @"class":DCKnowledgeARCMRCViewController.class},
                  @{@"itemTitle":@"单例",
                    @"class":DCKnowledgeARCMRCViewController.class},
                  @{@"itemTitle":@"多线程",
                    @"class":DCKnowledgeARCMRCViewController.class},
                  @{@"itemTitle":@"数据持久化",
                    @"class":DCKnowledgeARCMRCViewController.class},
                  @{@"itemTitle":@"WebView & H5",
                    @"class":DCKnowledgeARCMRCViewController.class},
                  @{@"itemTitle":@"Block",
                    @"class":DCKnowledgeARCMRCViewController.class},
                  @{@"itemTitle":@"Delegate",
                    @"class":DCKnowledgeARCMRCViewController.class},
                  @{@"itemTitle":@"Category",
                    @"class":DCKnowledgeARCMRCViewController.class},
                  @{@"itemTitle":@"Notification",
                    @"class":DCKnowledgeARCMRCViewController.class}
                  ];
    
}

@end
