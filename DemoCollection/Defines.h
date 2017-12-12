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
