//
//  DCMapBaiduViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/10/27.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCMapBaiduViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>

@interface DCMapBaiduViewController ()<BMKMapViewDelegate>

@end

@implementation DCMapBaiduViewController {
    
    BMKMapView *_mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"百度地图";
    

    
    _mapView = [[BMKMapView alloc] initWithFrame:self.view.bounds];
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态为普通定位模式
    self.view = _mapView;
}

- (void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
}

@end
