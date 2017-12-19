//
//  DCNetworkSimpleViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/18.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCNetworkSimpleViewController.h"
#import <MJRefresh.h>

@interface DCNetworkSimpleViewController ()<UITableViewDelegate,UITableViewDataSource> {
    NSInteger _currentPage;
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSMutableArray *list;
@end

@implementation DCNetworkSimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _list = [NSMutableArray array];
    
    [self layoutUI];
    
    [self sendRequest];
}

- (void)layoutUI {
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        tableView.backgroundColor = [UIColor lightGrayColor];
        tableView;
    });
    
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

    [footer setTitle:@"加载更多内容" forState:MJRefreshStateRefreshing];

    self.tableView.mj_footer = footer;
}

- (void)sendRequest {
    NSString *urlStr = [NSString stringWithFormat:@"http://route.showapi.com/109-35"];
    NSCharacterSet *cSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:cSet];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *requestM = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:0 timeoutInterval:5.0f];
    [requestM setHTTPMethod:@"POST"];
    
    NSString *bodyDataStr = [NSString stringWithFormat:@"showapi_appid=%@&showapi_sign=%@",cYiyuanAppId,cYiyuanAppScrect];
    NSData *bodyData = [bodyDataStr dataUsingEncoding:NSUTF8StringEncoding];
    [requestM setHTTPBody:bodyData];
    
    //发送一个异步请求
    [NSURLConnection sendAsynchronousRequest:requestM queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (!connectionError) {
            DLog(@"download data success");
            [self loadData:data];
            _currentPage = 1;
            [_tableView reloadData];
        
        } else {
            DLog(@"download data failed with error = %@",connectionError.localizedDescription);
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
            }];
        }
    }];
}

- (void)loadMoreData {
    NSString *urlStr = [NSString stringWithFormat:@"http://route.showapi.com/109-35"];
    NSCharacterSet *cSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:cSet];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *requestM = [NSMutableURLRequest requestWithURL:url];
    NSString *bodyDataStr = [NSString stringWithFormat:@"showapi_appid=%@&showapi_sign=%@&page=%d",cYiyuanAppId,cYiyuanAppScrect,++_currentPage];
    NSData *bodyData = [bodyDataStr dataUsingEncoding:NSUTF8StringEncoding];
    [requestM setHTTPBody:bodyData];
    [requestM setHTTPMethod:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:requestM queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (!connectionError) {
            [self loadData:data];
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }
    }];
}

- (void)loadData:(NSData *)data {
    
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    DLog(@"dict = %@",dic);
    NSNumber *showapi_res_code = dic[@"showapi_res_code"];
    NSDictionary *showapi_res_body = dic[@"showapi_res_body"];
    
    if ([showapi_res_code isEqual:@(0)]) {
        NSNumber *ret_code = showapi_res_body[@"ret_code"];
        if ([ret_code isEqual:@(0)]) {
            NSDictionary *pagebean = showapi_res_body[@"pagebean"];
            NSArray *array = (NSArray *)pagebean[@"contentlist"];
            [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [_list addObject:obj];
            }];
        } else {
            DLog(@"error = %@",showapi_res_body[@"error"]);
        }
    } else {
        DLog(@"error = %@",dic[@"showapi_res_error"]);
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *DCNetworkSimpleCellId = @"DCNetworkSimpleCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DCNetworkSimpleCellId];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:DCNetworkSimpleCellId];
    }
    
    NSDictionary *dict = self.list[indexPath.row];
    cell.textLabel.text = dict[@"title"];
    cell.detailTextLabel.text = dict[@"channelName"];
    
    return cell;
}

@end
