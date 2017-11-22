//
//  QOverlayView.h
//  QMapKit
//
//  Created by fan on 2017/5/17.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QOverlay.h"

@interface QOverlayView : UIView

@property (nonatomic, readonly) id <QOverlay> overlay;

@end
