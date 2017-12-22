//
//  QCircleView.h
//  QMapKit
//
//  Created by fan on 2017/5/21.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "QOverlayPathView.h"
#import "QCircle.h"

@interface QCircleView : QOverlayPathView

/**
 *  @brief  根据指定圆生成对应的view
 *
 *  @param circle 指定的QCircle对象
 *
 *  @return 生成的view
 */
- (id)initWithCircle:(QCircle *)circle;

/**
 *  @brief  关联的QCirlce对象
 */
@property (nonatomic, readonly) QCircle *circle;

@end
