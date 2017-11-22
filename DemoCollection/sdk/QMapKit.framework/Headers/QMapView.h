//
//  QMapView.h
//  QMapKit
//
//  Created by tabsong on 17/5/15.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QGeometry.h"
#import "QAnnotation.h"
#import "QAnnotationView.h"
#import "QOverlayView.h"
#import "QBasicMapViewLayer.h"
#import "QTypes.h"
#import "QUserLocationPresentation.h"
#import "QTileOverlay.h"

typedef NS_ENUM(NSInteger, QUserTrackingMode)
{
    QUserTrackingModeNone              = 0,    ///< 不追踪用户的location更新
    QUserTrackingModeFollow            = 1,    ///< 追踪用户的location更新
    QUserTrackingModeFollowWithHeading = 2     ///< 追踪用户的location与heading更新
};

@class QUserLocation;
@protocol QMapViewDelegate;

#pragma mark - QMapView

@interface QMapView : UIView

#pragma mark - Basic

/**
 * @brief 地图回调
 */
@property (nonatomic, weak) id<QMapViewDelegate>    delegate;

/**
 * @brief 改变底图样式
 *
 * @see QMapStyleType
 */
- (void)setStyleType:(QMapStyleType)styleType;

/**
 *  @brief  是否显示比例尺，默认为YES
 */
@property (nonatomic) BOOL showsScale;

/**
 *  @brief  是否显示建筑物，默认为YES
 */
@property (nonatomic) BOOL showsBuildings;

/**
 *  @brief  是否显示指南针，默认为NO
 */
@property (nonatomic) BOOL showsCompass;

/**
 *  @brief 设置中心点偏移，向下为正. 单位：比例值(-0.5 ~ 0.5)默认为0
 */
- (void)setCenterOffsetY:(float)offset;

/**
 * @brief  设置地图Logo偏移
 * @param offset Logo中心的偏移量. 如果offset为CGPointZero则为默认位置
 */
- (void)setLogoOffset:(CGPoint)offset;

/**
 * @brief  设置地图比例尺偏移
 * @param offset 比例尺的偏移量. 如果offset为CGPointZero则为默认位置
 */
- (void)setScaleViewOffset:(CGPoint)offset;

/**
 * @brief 地图动画Layer.
 * 使用该layer 可以更灵活的组合 {centerCoordinate, zoomLevel, rotation, overlooking} 动画，
 * 并且可以自定义其duration, timingFunction 等CoreAnimation所支持的一切动画属性.
 */
@property (nonatomic, readonly) QBasicMapViewLayer *animationLayer;

#pragma mark - MapStatus

/*!
 *  @brief  中心点经纬度
 */
@property (nonatomic, assign) CLLocationCoordinate2D centerCoordinate;

/*!
 *  @brief  设置中心点经纬度
 *
 *  @param coordinate  中心点经纬度
 *  @param animated 是否采用动画
 */
- (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated;

/*!
 *  @brief  缩放级别, 范围 [minZoomLevel, maxZoomLevel]
 */
@property (nonatomic, assign) CGFloat zoomLevel;

/*!
 *  @brief  最小缩放级别 minZoomLevel = 3
 */
@property (nonatomic, readonly) CGFloat minZoomLevel;

/*!
 *  @brief  最大缩放级别 maxZoomLevel = 19
 */
@property (nonatomic, readonly) CGFloat maxZoomLevel;

/*!
 *  @brief  设置缩放级别
 *
 *  @param zoomLevel  缩放级别
 *  @param animated 是否采用动画
 */
- (void)setZoomLevel:(CGFloat)zoomLevel animated:(BOOL)animated;

/*!
 *  @brief  旋转角度, 正角度向右转, 单位(角度)
 */
@property (nonatomic, assign) CGFloat rotation;

/*!
 *  @brief  设置旋转角度, 正角度向右转, 单位(角度)
 *
 *  @param rotation  overlooking
 *  @param animated 是否采用动画
 */
- (void)setRotation:(CGFloat)rotation animated:(BOOL)animated;

/*!
 *  @brief  Overlooking, 范围 [0, 45], 单位(角度)
 */
@property (nonatomic, assign) CGFloat overlooking;

/*!
 *  @brief  设置overlooking, 范围 [0, 45], 单位(角度)
 *
 *  @param overlooking  overlooking
 *  @param animated 是否采用动画
 */
- (void)setOverlooking:(CGFloat)overlooking animated:(BOOL)animated;

/*!
 *  @brief  当前地图可见范围的mapRect
 */
@property (nonatomic) QMapRect visibleMapRect;

/*!
 *  @brief  设置当前地图可见范围的mapRect
 *
 *  @param mapRect  目标mapRect
 *  @param animated 是否采用动画
 */
- (void)setVisibleMapRect:(QMapRect)mapRect animated:(BOOL)animated;

/*!
 *  @brief  设置当前地图可见范围的mapRect
 *
 *  @param mapRect  目标mapRect
 *  @param insets   要嵌入的边界
 *  @param animated 是否采用动画
 */
- (void)setVisibleMapRect:(QMapRect)mapRect edgePadding:(UIEdgeInsets)insets animated:(BOOL)animated;

/*!
 *  @brief  当前地图的经纬度范围，设定的该范围可能会被调整为适合地图窗口显示的范围
 */
@property (nonatomic) QCoordinateRegion region;

/*!
 *  @brief  设定当前地图的region
 *
 *  @param region   要设定的地图范围，用经纬度的方式表示
 *  @param animated 是否采用动画
 */
- (void)setRegion:(QCoordinateRegion)region animated:(BOOL)animated;

/*!
 *  @brief  设定当前地图的region
 *
 *  @param region   要设定的地图范围，用经纬度的方式表示
 *  @param insets   要嵌入的边界
 *  @param animated 是否采用动画
 */
- (void)setRegion:(QCoordinateRegion)region edgePadding:(UIEdgeInsets)insets animated:(BOOL)animated;

/**
 * @brief  根据边界留宽计算合适的地理范围
 * @param mapRect 待调整的地理范围
 * @return 调整后的地图范围
 */
- (QMapRect)mapRectThatFits:(QMapRect)mapRect edgePadding:(UIEdgeInsets)insets;

/**
 * @brief  根据当前地图View的窗口大小调整传入的mapRect，返回适合当前地图窗口显示的mapRect
 * @param mapRect 待调整的地理范围
 * @param bContainsCalloutView 计算的maprect是否需要包含calloutView
 * @param annotations 要包含的annotation 数组
 * @param insets mapRect四周要预留的边界大小
 * @return 调整后适合当前地图窗口显示的地图范围
 */
- (QMapRect)mapRectThatFits: (QMapRect)mapRect
        containsCalloutView:(BOOL)bContainsCalloutView
                annotations:(NSArray*)annotations
                edgePadding:(UIEdgeInsets)insets;

#pragma mark - Gesture Control

/**
 * 设定地图View能否支持用户多点缩放, 默认为YES.
 */
@property(nonatomic, getter=isZoomEnabled) BOOL zoomEnabled;

/**
 * 设定地图View能否支持用户移动地图, 默认为YES.
 */
@property(nonatomic, getter=isScrollEnabled) BOOL scrollEnabled;

/**
 * @brief  是否支持俯视. 默认为YES.
 */
@property (nonatomic, assign, getter=isOverlookingEnabled) BOOL overlookingEnabled;

/**
 * @brief  是否支持旋转. 默认为YES.
 */
@property (nonatomic, assign, getter=isRotateEnabled) BOOL rotateEnabled;

#pragma mark - Coordinate Convert

/**
 * @brief  将经纬度坐标转换为View坐标
 * @param coordinate 待转换的经纬度坐标
 * @param view 指定相对的View
 * @return 转换后的View坐标
 */
- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)coordinate toPointToView:(UIView *)view;

/**
 * @brief  将View坐标转换成经纬度坐标
 * @param point 待转换的View坐标
 * @param view point坐标所在的view
 * @return 转换后的经纬度坐标
 */
- (CLLocationCoordinate2D)convertPoint:(CGPoint)point toCoordinateFromView:(UIView *)view;

/**
 * @brief  将经纬度矩形区域转换为View矩形区域
 * @param region 待转换的经纬度矩形
 * @param view 指定相对的View
 * @return 转换后的View矩形区域
 */
- (CGRect)convertRegion:(QCoordinateRegion)region toRectToView:(UIView *)view;

/**
 * @brief  将View矩形区域转换成经纬度矩形区域
 * @param rect 待转换的View矩形区域
 * @param view rect坐标所在的view
 * @return 转换后的经纬度矩形区域
 */
- (QCoordinateRegion)convertRect:(CGRect)rect toRegionFromView:(UIView *)view;

@end

@interface QMapView (UserLocation)

/**
 * @brief 配置当前位置UI属性 (必须在QMapView 初始化以后, 定位开启之前调用)
 *
 * @param presentation 位置UI属性
 */
- (void)configureUserLocationPresentation:(QUserLocationPresentation *)presentation;

/**
 * @brief 开启定位并展示位置图标.
 */
@property (nonatomic, assign) BOOL showsUserLocation;

/**
 * @brief 当前位置信息
 */
@property (nonatomic, readonly) QUserLocation *userLocation;

/**
 * @brief 设定定位精度。默认为kCLLocationAccuracyBest
 */
@property (nonatomic) CLLocationAccuracy desiredAccuracy;

/**
 * @brief 设定定位的最小更新距离。默认为kCLDistanceFilterNone，会提示任何移动
 */
@property (nonatomic) CLLocationDistance distanceFilter;


/**
 * @brief 设定最小更新角度。默认为1度，设定为kCLHeadingFilterNone会提示任何角度改变
 */
@property (nonatomic) CLLocationDegrees headingFilter;

/*!
 *  @brief  定位用户位置的模式
 */
@property (nonatomic) QUserTrackingMode userTrackingMode;

/*!
 *  @brief  设置追踪用户位置的模式
 *
 *  @param mode     要使用的模式
 *  @param animated 是否采用动画
 */
- (void)setUserTrackingMode:(QUserTrackingMode)mode animated:(BOOL)animated;

/*!
 *  @brief  当前位置在地图中是否可见
 */
@property (nonatomic, readonly, getter=isUserLocationVisible) BOOL userLocationVisible;


@end

@interface QMapView (Annotation)

/**
 * @brief  当前地图View的已经添加的标注数组
 */
@property(nonatomic, readonly) NSArray *annotations;

/**
 * @brief  当前选中的annotations
 */
@property (nonatomic, readonly) NSArray<id<QAnnotation>> *selectedAnnotations;

/**
 * @brief  向地图窗口添加标注，需要实现QMapViewDelegate的-mapView:viewForAnnotation:函数来生成标注对应的View
 *
 * @param annotation 要添加的标注
 */
- (void)addAnnotation:(id <QAnnotation>)annotation;

/**
 * @brief  向地图窗口添加一组标注，需要实现QMapViewDelegate的-mapView:viewForAnnotation:函数来生成标注对应的View
 * @param annotations 要添加的标注数组
 */
- (void)addAnnotations:(NSArray *)annotations;

/**
 * @brief  移除标注
 * @param annotation 要移除的标注
 */
- (void)removeAnnotation:(id <QAnnotation>)annotation;

/**
 * @brief  移除一组标注
 * @param annotations 要移除的标注数组
 */
- (void)removeAnnotations:(NSArray *)annotations;

/**
 * @brief  查找指定标注对应的View，如果该标注尚未显示，返回nil
 * @param annotation 指定的标注
 * @return 指定标注对应的View
 */
- (QAnnotationView *)viewForAnnotation:(id <QAnnotation>)annotation;

/**
 * @brief  根据指定标识查找一个可被复用的标注View，一般在delegate中使用，用此函数来代替新申请一个View
 * @param identifier 指定标识
 * @return 返回可被复用的标注View
 */
- (QAnnotationView *)dequeueReusableAnnotationViewWithIdentifier:(NSString *)identifier;

/**
 * @brief  将制定的annotation放在最上层渲染.
 *  @param annotation 指定的annotation
 */
- (void)bringAnnotationToFront:(id <QAnnotation>)annotation;

/**
 * @brief  选中指定的标注
 * @param annotation 指定的标注
 * @param animated 是否支持动画
 */
- (void)selectAnnotation:(id <QAnnotation>)annotation animated:(BOOL)animated;

/**
 * @brief  取消指定的标注的选中状态
 * @param annotation 指定的标注
 * @param animated 是否支持动画
 */
- (void)deselectAnnotation:(id <QAnnotation>)annotation animated:(BOOL)animated;

@end


#pragma mark - Overlay


@interface QMapView (Overlay)

/**
 * @brief  当前mapView中已经添加的Overlay数组
 */
@property (nonatomic, readonly) NSArray *overlays;

/**
 * @brief  向地图窗口添加Overlay，需要实现QMapViewDelegate的-mapView:viewForOverlay:函数来生成标注对应的View
 * @param overlay 要添加的overlay
 */
- (void)addOverlay:(id <QOverlay>)overlay;

/**
 * @brief  批量向地图窗口添加Overlay，需要实现QMapViewDelegate的-mapView:viewForOverlay:函数来生成标注对应的View
 * @param overlays 要添加的overlay列表
 */
- (void)addOverlays:(NSArray<id <QOverlay>> *)overlays;

/**
 * @brief  移除Overlay
 * @param overlay 要移除的overlay
 */
- (void)removeOverlay:(id <QOverlay>)overlay;

/**
 * @brief  移除Overlay
 * @param overlays 要移除的overlay列表
 */
- (void)removeOverlays:(NSArray<id <QOverlay>> *)overlays;

/**
 * @brief  返回指定overlay对象的OverlayView
 * @param overlay 待查询的overlay
 * @return 对应的OverlayView
 */
- (QOverlayView *)viewForOverlay:(id <QOverlay>)overlay;

@end

/**
 * @brief  QMapView(TileOverlay):热力图相关的API
 */
@interface QMapView (TileOverlay)

/**
 *  @brief  添加tileOverlay
 *
 *  @param tileOverlay 要添加的tileOverlay
 */
- (void)addTileOverlay:(QTileOverlay *)tileOverlay;

/**
 *  @brief  移除tileOverlay
 *
 *  @param tileOverlay 要移除的tileOverlay
 */
- (void)removeTileOverlay:(QTileOverlay *)tileOverlay;

/**
 *  @brief  强制tileOverlay重新加载数据.
 *
 *  @param tileOverlay tileOverlay
 */
- (void)reloadTileOverlay:(QTileOverlay *)tileOverlay;

/**
 *  @brief  当前地图上的tileOverlay数组
 */
@property (nonatomic, readonly) NSArray *tileOverlays;

@end

/**
 * @brief  截图相关API
 */
@interface QMapView (Snapshot)

/**
 *  @brief  截图
 *
 *  @return 截图image
 */
- (UIImage *)takeSnapshot;

@end


#pragma mark - QMapViewDelegate

/**
 * @brief QMapViewDelegate:MapView的Delegate,mapView通过此类来通知用户对应的事件
 **/
@protocol QMapViewDelegate <NSObject>

@optional

/**
 * @brief  地图区域即将改变时会调用此接口
 * @param mapView 地图View
 * @param animated 是否动画
 * @param bGesture 是否由手势触发
 */
- (void)mapView:(QMapView *)mapView regionWillChangeAnimated:(BOOL)animated gesture:(BOOL)bGesture;

/**
 * @brief  地图区域改变完成后会调用此接口,如果是由手势触发，当触摸结束且地图region改变的动画结束后才会触发此回调
 * @param mapView 地图View
 * @param animated 是否动画
 * @param bGesture region变化是否由手势触发
 */
- (void)mapView:(QMapView *)mapView regionDidChangeAnimated:(BOOL)animated gesture:(BOOL)bGesture;

/**
 * @brief  点击地图空白处会调用此接口.
 * @param mapView 地图View
 * @param coordinate 坐标
 */
- (void)mapView:(QMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate;

/**
 * @brief 根据anntation生成对应的View
 * @param mapView 地图View
 * @param annotation 指定的标注
 * @return 生成的标注View
 */
- (QAnnotationView *)mapView:(QMapView *)mapView viewForAnnotation:(id <QAnnotation>)annotation;

/**
 * @brief 根据anntationView生成对应的CustomCallout (当标注被选中后会调用)
 * @param mapView 地图View
 * @param annotationView 指定的标注view
 * @return 对应的CustomCallout
 */
- (UIView *)mapView:(QMapView *)mapView customCalloutForAnnotationView:(QAnnotationView *)annotationView;

/**
 * @brief  当mapView新添加annotation views时，调用此接口
 * @param mapView 地图View
 * @param views 新添加的annotation views
 */
- (void)mapView:(QMapView *)mapView didAddAnnotationViews:(NSArray<QAnnotationView *> *)views;

/**
 * @brief  当选中一个annotation view时，调用此接口
 * @param mapView 地图View
 * @param view 选中的annotation view
 */
- (void)mapView:(QMapView *)mapView didSelectAnnotationView:(QAnnotationView *)view;

/**
 * @brief  当取消选中一个annotation view时，调用此接口
 * @param mapView 地图View
 * @param view 取消选中的annotation view
 */
- (void)mapView:(QMapView *)mapView didDeselectAnnotationView:(QAnnotationView *)view;

/*!
 *  @brief  拖动annotationView时view的状态变化
 *
 *  @param mapView  地图view
 *  @param view     目标annotationView
 *  @param newState 新状态
 *  @param oldState 旧状态
 */
- (void)mapView:(QMapView *)mapView annotationView:(QAnnotationView *)view didChangeDragState:(QAnnotationViewDragState)newState
   fromOldState:(QAnnotationViewDragState)oldState;

/*!
 *  @brief  标注view的accessory view(必须继承自UIControl)被点击时，触发该回调
 *
 *  @param mapView 地图view
 *  @param view    callout所属的标注view
 *  @param control 对应control
 */
- (void)mapView:(QMapView *)mapView annotationView:(QAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;

/**
 * @brief  根据overlay生成对应的View
 * @param mapView 地图View
 * @param overlay 指定的overlay
 * @return 生成的覆盖物View
 */
- (QOverlayView *)mapView:(QMapView *)mapView viewForOverlay:(id <QOverlay>)overlay;

/**
 * @brief  当mapView新添加overlay views时，调用此接口
 * @param mapView 地图View
 * @param overlayViews 新添加的overlay views
 */
- (void)mapView:(QMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews;

/**
 * @brief  在地图View将要启动定位时，会调用此函数
 * @param mapView 地图View
 */
- (void)mapViewWillStartLocatingUser:(QMapView *)mapView;

/**
 * @brief  在地图View停止定位后，会调用此函数
 * @param mapView 地图View
 */
- (void)mapViewDidStopLocatingUser:(QMapView *)mapView;

/**
 * @brief 用户位置更新后，会调用此函数
 * @param mapView 地图View
 * @param userLocation 新的用户位置
 * @param fromHeading 是否为heading 变化触发，如果为location变化触发,则为NO
 */
- (void)mapView:(QMapView *)mapView didUpdateUserLocation:(QUserLocation *)userLocation fromHeading:(BOOL)fromHeading;
/**
 * @brief  定位失败后，会调用此函数
 * @param mapView 地图View
 * @param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(QMapView *)mapView didFailToLocateUserWithError:(NSError *)error;

/**
 * @brief 定位时的userTrackingMode 改变时delegate调用此函数
 *  @param mapView 地图View
 *  @param mode QMUserTrackingMode
 *  @param animated 是否有动画
 */
- (void)mapView:(QMapView *)mapView didChangeUserTrackingMode:(QUserTrackingMode)mode animated:(BOOL)animated;

@end
