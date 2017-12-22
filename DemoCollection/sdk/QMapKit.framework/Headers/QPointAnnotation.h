//
//  QPointAnnotation.h
//  QMapKit
//
//  Created by tabsong on 17/5/18.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "QShape.h"
#import "QAnnotation.h"
#import <CoreLocation/CoreLocation.h>

@interface QPointAnnotation : QShape <QAnnotation>

/*!
 *  @brief  经纬度
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

/*!
 *  @brief  标题
 */
@property (copy) NSString *title;

/*!
 *  @brief  副标题
 */
@property (copy) NSString *subtitle;

@end
