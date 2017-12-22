//
//  DCMapViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/10/27.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCMapViewController.h"
#import "DCMapBaiduViewController.h"
#import "DCMapGaodeViewController.h"
#import "DCMapTencentViewController.h"


@interface DCMapViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *listArr;
@end

@implementation DCMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listArr = @[@{@"itemTitle":@"百度地图",
                       @"class":DCMapBaiduViewController.class},
                     @{@"itemTitle":@"高德地图",
                       @"class":DCMapGaodeViewController.class},
                     @{@"itemTitle":@"腾讯地图",
                       @"class":DCMapTencentViewController.class}
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
