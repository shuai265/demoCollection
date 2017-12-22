//
//  QOverlayPathView.h
//  QMapKit
//
//  Created by fan on 2017/5/17.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import "QOverlayView.h"

@interface QOverlayPathView : QOverlayView

/**
 * @brief  填充颜色
 */
@property(nonatomic, strong) UIColor *fillColor;

/**
 * @brief  画笔颜色
 */
@property(nonatomic, strong) UIColor *strokeColor;

/**
 * @brief  画笔宽度
 */
@property(nonatomic, assign) CGFloat lineWidth;

@end
