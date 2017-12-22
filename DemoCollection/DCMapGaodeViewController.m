//
//  DCMapGaodeViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/10/27.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCMapGaodeViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface DCMapGaodeViewController ()

@end

@implementation DCMapGaodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"高德地图";
    
    [AMapServices sharedServices].enableHTTPS = YES;
    
    //初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    //把地图添加至view
    [self.view addSubview:_mapView];
    
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
}

@end
