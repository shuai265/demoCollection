//
//  Defines.h
//  DemoCollection
//
//  Created by liushuai on 2017/11/22.
//  Copyright © 2017年 liu. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

//-------------------打印日志-------------------------

//DEBUG模式下打印日志,当前行
#define kLog(obj) NSLog(@"[%@]:%@",[self class],obj)

#ifdef DEBUG

#define DLog(fmt,...)NSLog((@"%s[Line %d]" fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__);

#else

#define DLog(...)

#endif


#endif /* Defines_h */


//---------------- 颜色 -------------------------
#define CCColor(r,g,b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1] //颜色宏定义


//------------- 屏幕 ---------------------
#define CC_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define CC_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
