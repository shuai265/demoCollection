//
//  DCDBSQLiteViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/12.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCDBSQLiteViewController.h"
#import "CCDbManager.h"
#import "CCDatabaseCreator.h"
#import "CCUser.h"
#import "CCStatus.h"
#import "CCUserService.h"
#import "CCStatusService.h"
#import "CCStatusTableViewCell.h"


@interface DCDBSQLiteViewController ()<UITableViewDelegate,UITableViewDataSource> {
    NSArray *_status;
    NSMutableArray *_statusCells;
}
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation DCDBSQLiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CCDatabaseCreator initDatabase];
    
    NSString *key = @"ISAddData";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults valueForKey:key] intValue] != 1) {
        [self addUsers];
        [self addStatus];
        [defaults setValue:@(1) forKey:key];
    }
    
    [self loadStatusData];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView;
    });
}

- (void)addUsers{
    CCUser *u1 = [CCUser userWithName:@"Binger" screenName:@"冰儿" profileImageUrl:@"binger.jpg" mbtype:@"mbtype.png" city:@"北京"];
    [[CCUserService sharedCCUserService] addUser:u1];
    CCUser *u2 = [CCUser userWithName:@"Xiaona" screenName:@"小娜" profileImageUrl:@"xiaona.jpg" mbtype:@"mbtype.png" city:@"北京"];
    [[CCUserService sharedCCUserService] addUser:u2];
    CCUser *u3 = [CCUser userWithName:@"lily.png" screenName:@"丽丽" profileImageUrl:@"lily.jpg" mbtype:@"mbtype.png" city:@"北京"];
    [[CCUserService sharedCCUserService] addUser:u3];
    CCUser *u4 = [CCUser userWithName:@"Qianmo" screenName:@"阡陌" profileImageUrl:@"qianmo.jpg" mbtype:@"mbtype.png" city:@"北京"];
    [[CCUserService sharedCCUserService] addUser:u4];
    CCUser *u5 = [CCUser userWithName:@"Yanyue" screenName:@"炎月" profileImageUrl:@"yanyue.jpg" mbtype:@"mbtype.png" city:@"北京"];
    [[CCUserService sharedCCUserService] addUser:u5];
}

- (void)addStatus {
    CCStatus *status1=[CCStatus statusWithCreatedAt:@"9:00" source:@"iPhone 6" text:@"一只雪猴在日本边泡温泉边玩iPhone的照片，获得了\"2014年野生动物摄影师\"大赛特等奖。一起来为猴子配个词" userId:1];
    [[CCStatusService sharedCCStatusService] addStatus:status1];
    CCStatus *status2=[CCStatus statusWithCreatedAt:@"9:00" source:@"iPhone 6" text:@"一只雪猴在日本边泡温泉边玩iPhone的照片，获得了\"2014年野生动物摄影师\"大赛特等奖。一起来为猴子配个词" userId:1];
    [[CCStatusService sharedCCStatusService] addStatus:status2];
    CCStatus *status3=[CCStatus statusWithCreatedAt:@"9:30" source:@"iPhone 6" text:@"【我们送iPhone6了 要求很简单】真心回馈粉丝，小编觉得现在最好的奖品就是iPhone6了。今起到12月31日，关注我们，转发微博，就有机会获iPhone6(奖品可能需要等待)！每月抽一台[鼓掌]。不费事，还是试试吧，万一中了呢" userId:2];
    [[CCStatusService sharedCCStatusService] addStatus:status3];
    CCStatus *status4=[CCStatus statusWithCreatedAt:@"9:45" source:@"iPhone 6" text:@"重大新闻：蒂姆库克宣布出柜后，ISIS战士怒扔iPhone，沙特神职人员呼吁人们换回iPhone 4。[via Pan-Arabia Enquirer]" userId:3];
    [[CCStatusService sharedCCStatusService] addStatus:status4];
    CCStatus *status5=[CCStatus statusWithCreatedAt:@"10:05" source:@"iPhone 6" text:@"小伙伴们，有谁知道怎么往Iphone4S里倒东西？倒入的东西又该在哪里找？用了Iphone这么长时间，还真的不知道怎么弄！有谁知道啊？谢谢！" userId:4];
    [[CCStatusService sharedCCStatusService] addStatus:status5];
    CCStatus *status6=[CCStatus statusWithCreatedAt:@"10:07" source:@"iPhone 6" text:@"在音悦台iPhone客户端里发现一个悦单《Infinite 金明洙》，推荐给大家! " userId:1];
    [[CCStatusService sharedCCStatusService] addStatus:status6];
    CCStatus *status7=[CCStatus statusWithCreatedAt:@"11:20" source:@"iPhone 6" text:@"如果sony吧mp3播放器产品发展下去，不贪图手头节目源的现实利益，就木有苹果的ipod，也就木有iphone。柯达类似的现实利益，不自我革命的案例也是一种巨头的宿命。" userId:2];
    [[CCStatusService sharedCCStatusService] addStatus:status7];
    CCStatus *status8=[CCStatus statusWithCreatedAt:@"13:00" source:@"iPhone 6" text:@"【iPhone 7 Plus】新买的iPhone 7 Plus ，如何？够酷炫么？" userId:2];
    [[CCStatusService sharedCCStatusService] addStatus:status8];
    CCStatus *status9=[CCStatus statusWithCreatedAt:@"13:24" source:@"iPhone 6" text:@"自拍神器#卡西欧TR500#，tr350S～价格美丽，行货，全国联保～iPhone6 iPhone6Plus卡西欧TR150 TR200 TR350 TR350S全面到货 招收各种代理！[给力]微信：39017366" userId:3];
    [[CCStatusService sharedCCStatusService] addStatus:status9];
    CCStatus *status10=[CCStatus statusWithCreatedAt:@"13:26" source:@"iPhone 6" text:@"猜到猴哥玩手机时所思所想者，再奖iPhone一部。（奖品由“2014年野生动物摄影师”评委会颁发）" userId:3];
    [[CCStatusService sharedCCStatusService] addStatus:status10];
}

- (void)removeUse {
    [[CCUserService sharedCCUserService] removeUserByName:@"yanyue"];
}

- (void)modifyUserInfo {
    CCUser *user1 = [[CCUserService sharedCCUserService] getUserByName:@"xiaona"];
    user1.city = @"上海";
    [[CCUserService sharedCCUserService] modifyUser:user1];
    
    CCUser *user2 = [[CCUserService sharedCCUserService] getUserByName:@"Lily"];
    user2.city = @"深圳";
    [[CCUserService sharedCCUserService] modifyUser:user2];
}

#pragma mark 加载数据
- (void)loadStatusData {
    _statusCells = [[NSMutableArray alloc] init];
    _status = [[CCStatusService sharedCCStatusService] getAllStatus];
    [_status enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CCStatusTableViewCell *cell = [[CCStatusTableViewCell alloc] init];
        cell.status = (CCStatus *)obj;
        [_statusCells addObject:cell];
    }];
    DLog(@"%@",[_status lastObject]);
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _status.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identityKey = @"myTableViewCellIdentityKey1";
    CCStatusTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identityKey];
    if (cell == nil) {
        cell = [[CCStatusTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identityKey];
    }
    cell.status = _status[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCStatusTableViewCell *cell = (CCStatusTableViewCell *)_statusCells[indexPath.row];
    cell.status = _status[indexPath.row];
    return cell.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0f;
}

@end
