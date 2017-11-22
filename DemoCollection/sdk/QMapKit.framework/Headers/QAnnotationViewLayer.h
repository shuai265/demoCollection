//
//  QAnnotationViewLayer.h
//  QMapKit
//
//  Created by tabsong on 17/5/21.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface QAnnotationViewLayer : CALayer

/*!
 *  @brief  坐标平移动画的keyPath, animatable
 *   x 表示 latitude
 *   y 表示 longitude
 */
@property (nonatomic, assign) CGPoint coordinate;

@end
