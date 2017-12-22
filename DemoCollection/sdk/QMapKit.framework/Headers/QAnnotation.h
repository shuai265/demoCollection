//
//  QAnnotation.h
//  QMapKit
//
//  Created by tabsong on 17/5/18.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>

@protocol QAnnotation <NSObject>

/*!
 *  @brief  标注view中心坐标
 */
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@optional

/*!
 *  @brief  获取annotation标题
 *
 *  @return 返回annotation的标题信息
 */
- (NSString *)title;

/*!
 *  @brief  获取annotation副标题
 *
 *  @return 返回annotation的副标题信息
 */
- (NSString *)subtitle;

/*!
 *  @brief  设置标注的坐标，在拖拽时会被调用
 *
 *  @param newCoordinate 新的坐标值
 */
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
