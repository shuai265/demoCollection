//
//  CCStatusTableViewCell.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/15.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCStatus;

@interface CCStatusTableViewCell : UITableViewCell

@property (nonatomic,strong) CCStatus *status;

@property (assign) CGFloat height;

@end
