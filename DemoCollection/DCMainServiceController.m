//
//  DCMainServiceController.m
//  DemoCollection
//
//  Created by liushuai on 2017/10/27.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCMainServiceController.h"
#import "DCMapViewController.h"

@interface DCMainServiceController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *listArr;
@end

@implementation DCMainServiceController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.listArr = @[@{@"itemTitle":@"地图",
                       @"class":DCMapViewController.class
                       },
                     @{@"itemTitle":@"分享"},
                     @{@"itemTitle":@"支付"},
                     @{@"itemTitle":@"推送"},
                     @{@"itemTitle":@"蒲公英"},
                     @{@"itemTitle":@"leanCloud"},
                     @{@"itemTitle":@"讯飞语音"}
                     ];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}


#pragma mark - tableView delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSDictionary *itemDict = self.listArr[indexPath.row];
    cell.textLabel.text = itemDict[@"itemTitle"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *itemDict = self.listArr[indexPath.row];
    Class vcClass = itemDict[@"class"];
    UIViewController *vc = [[vcClass alloc]init];
    vc.navigationItem.title = itemDict[@"itemTitle"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end