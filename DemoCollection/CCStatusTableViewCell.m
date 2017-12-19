//
//  CCStatusTableViewCell.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/15.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "CCStatusTableViewCell.h"
#import "CCStatus.h"
#import "Defines.h"

#define cStatusTableViewCellControlSpacing 10 //控件间距
#define cStatusTableViewCellBackgroundColor CCColor(251,251,251)
#define cStatusGrayColor CCColor(50,50,50)
#define cStatusLightGrayColor CCColor(120,120,120)

#define cStatusTableViewCellAvatarWidth 40 //头像宽度
#define cStatusTableViewCellAvatarHeight cStatusTableViewCellAvatarWidth
#define cStatusTableViewCellUserNameFontSize 14
#define cStatusTableViewCellMbTypeWidth 13 //会员图标宽度
#define cStatusTableViewCellMbTypeHeight cStatusTableViewCellMbTypeWidth
#define cStatusTableViewCellCreateAtFontSize 12
#define cStatusTableViewCellSourceFontSize 12
#define cStatusTableViewCellTextFontSize 14

@interface CCStatusTableViewCell(){
    UIImageView *_avatar;//头像
    UIImageView *_mbType;//会员类型
    UILabel *_userName;
    UILabel *_createAt;
    UILabel *_source;
    UILabel *_text;
}

@end

@implementation CCStatusTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self initSubView];
    }
    return self;
}

#pragma mark 初始化视图
- (void)initSubView {
    _avatar = [[UIImageView alloc] init];
    [self.contentView addSubview:_avatar];
    
    _userName = [[UILabel alloc] init];
    _userName.textColor = cStatusGrayColor;
    _userName.font = [UIFont systemFontOfSize:cStatusTableViewCellUserNameFontSize];
    [self.contentView addSubview:_userName];
    
    _mbType = [[UIImageView alloc]init];
    [self.contentView addSubview:_mbType];
    
    _createAt = [[UILabel alloc] init];
    _createAt.textColor = cStatusLightGrayColor;
    _createAt.font = [UIFont systemFontOfSize:cStatusTableViewCellCreateAtFontSize];
    [self.contentView addSubview:_createAt];
    
    _source = [[UILabel alloc] init];
    _source.textColor = cStatusLightGrayColor;
    _source.font = [UIFont systemFontOfSize:cStatusTableViewCellSourceFontSize];
    [self.contentView addSubview:_source];
    
    _text = [[UILabel alloc] init];
    _text.textColor = cStatusGrayColor;
    _text.font = [UIFont systemFontOfSize:cStatusTableViewCellTextFontSize];
    _text.numberOfLines = 0;
    [self.contentView addSubview:_text];
}

#pragma mark 设置微博
- (void)setStatus:(CCStatus *)status {
    //设置头像大小和位置、图片
    CGFloat avatarX=10, avatarY=10;
    CGRect avatarRect = CGRectMake(avatarX, avatarY, cStatusTableViewCellAvatarWidth, cStatusTableViewCellAvatarHeight);
    _avatar.image = [UIImage imageNamed:status.user.profileImageUrl];
    _avatar.frame = avatarRect;
    
    //设置会员图标大小和位置
    CGFloat userNameX = CGRectGetMaxX(_avatar.frame)+cStatusTableViewCellControlSpacing;
    CGFloat userNameY = avatarY;
    CGSize userNameSize = [status.user.screenName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:cStatusTableViewCellUserNameFontSize]}];
    CGRect userNameRect = CGRectMake(userNameX, userNameY, userNameSize.width, userNameSize.height);
    _userName.text = status.user.screenName;
    _userName.frame = userNameRect;
    
    //设置会员图标大小和位置
    CGFloat mbTypeX = CGRectGetMaxX(_userName.frame) + cStatusTableViewCellControlSpacing;
    CGFloat mbTypeY = avatarY;
    CGRect mbTypeRect = CGRectMake(mbTypeX, mbTypeY, cStatusTableViewCellMbTypeWidth, cStatusTableViewCellMbTypeHeight);
    _mbType.image = [UIImage imageNamed:status.user.mbtype];
    _mbType.frame = mbTypeRect;
    
    //设置发布日期大小和位置
    CGSize createAtSize = [status.createdAt sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:cStatusTableViewCellCreateAtFontSize]}];
    CGFloat createAtX = userNameX;
    CGFloat createAtY = CGRectGetMaxY(_avatar.frame) - createAtSize.height;
    CGRect createAtRect = CGRectMake(createAtX, createAtY, createAtSize.width, createAtSize.height);
    _createAt.text = status.createdAt;
    _createAt.frame = createAtRect;
    
    //设置设备信息大小和位置
    CGSize sourceSize = [status.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:cStatusTableViewCellSourceFontSize]}];
    CGFloat sourceX = CGRectGetMaxX(_createAt.frame) + cStatusTableViewCellControlSpacing;
    CGFloat sourceY = createAtY;
    CGRect sourceRect = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    _source.text = status.source;
    _source.frame = sourceRect;
    
    //设置微博内容大小和位置
    CGFloat textX = avatarX;
    CGFloat textY = CGRectGetMaxY(_avatar.frame)+cStatusTableViewCellControlSpacing;
    CGFloat textWidth = self.frame.size.width - cStatusTableViewCellControlSpacing*2;
    CGSize textSize = [status.text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:cStatusTableViewCellTextFontSize]} context:nil].size;
    CGRect textRect = CGRectMake(textX, textY, textSize.width, textSize.height);
    _text.text = status.text;
    _text.frame = textRect;
    
    _height = CGRectGetMaxY(_text.frame) + cStatusTableViewCellControlSpacing;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
