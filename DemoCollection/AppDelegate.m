//
//  AppDelegate.m
//  DemoCollection
//
//  Created by liushuai on 2017/10/27.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "AppDelegate.h"
#import "DCMainTabBarController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <AMapFoundationKit/AMapFoundationKit.h>


@interface AppDelegate ()

@end

@implementation AppDelegate {
    BMKMapManager * _mapManager;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:[[DCMainTabBarController alloc]init]];
    [self.window makeKeyAndVisible];
    
    //初始化第三方服务
    [self setupThirdPartyService];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}

- (void)setupThirdPartyService {
    //百度地图
    _mapManager = [[BMKMapManager alloc] init];
    BOOL ret = [_mapManager start:@"1vA2k0IZO97Faw15eb6nw46mKoXqPHM4" generalDelegate:nil];
    if (!ret) {
        DLog(@"manager start failed");
    }
    
    //高德地图
    [AMapServices sharedServices].apiKey = @"c5cfcf8480215e60efed12b97bf1781b";
}

@end
