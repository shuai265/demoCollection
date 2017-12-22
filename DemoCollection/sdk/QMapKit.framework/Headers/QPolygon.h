//
//  QPolygon.h
//  QMapKit
//
//  Created by fan on 2017/5/19.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "QMultiPoint.h"

@interface QPolygon : QMultiPoint

/**
 *  @brief  根据经纬度坐标数据生成闭合多边形
 *
 *  @param coords 经纬度坐标点数据, coords对应的内存会拷贝, 调用者负责该内存的释放
 *  @param count  经纬度坐标点数组个数
 *
 *  @return 新生成的多边形
 */
+ (QPolygon *)polygonWithCoordinates:(CLLocationCoordinate2D *)coords count:(NSUInteger)count;

/**
 *  @brief  根据mapPoint数据生成多边形
 *
 *  @param points mapPoint数据,points对应的内存会拷贝,调用者负责该内存的释放
 *  @param count  点的个数
 *
 *  @return 新生成的多边形
 */
+ (QPolygon *)polygonWithPoints:(QMapPoint *)points count:(NSUInteger)count;

/**
 *  @brief  根据经纬度坐标数据生成闭合多边形
 *
 *  @param coords 经纬度坐标点数据, coords对应的内存会拷贝, 调用者负责该内存的释放
 *  @param count  经纬度坐标点数组个数
 *
 *  @return 新生成的多边形
 */
-(id)initWithWithCoordinates:(CLLocationCoordinate2D *)coords count:(NSUInteger)count;

/**
 *  @brief  根据mapPoint数据生成多边形
 *
 *  @param points mapPoint数据,points对应的内存会拷贝,调用者负责该内存的释放
 *  @param count  点的个数
 *
 *  @return 新生成的多边形
 */
- (id)initWithPoints:(QMapPoint *)points count:(NSUInteger)count;

@end
