
### 21. 下面的代码输出什么？

[原文地址](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01%E3%80%8A%E6%8B%9B%E8%81%98%E4%B8%80%E4%B8%AA%E9%9D%A0%E8%B0%B1%E7%9A%84iOS%E3%80%8B%E9%9D%A2%E8%AF%95%E9%A2%98%E5%8F%82%E8%80%83%E7%AD%94%E6%A1%88/%E3%80%8A%E6%8B%9B%E8%81%98%E4%B8%80%E4%B8%AA%E9%9D%A0%E8%B0%B1%E7%9A%84iOS%E3%80%8B%E9%9D%A2%E8%AF%95%E9%A2%98%E5%8F%82%E8%80%83%E7%AD%94%E6%A1%88%EF%BC%88%E4%B8%8A%EF%BC%89.md#4-%E8%BF%99%E4%B8%AA%E5%86%99%E6%B3%95%E4%BC%9A%E5%87%BA%E4%BB%80%E4%B9%88%E9%97%AE%E9%A2%98-property-copy-nsmutablearray-array)

```Objective-C
@implementation Son : Father
- (id)init
{
self = [super init];
if (self) {
NSLog(@"%@", NSStringFromClass([self class]));
NSLog(@"%@", NSStringFromClass([super class]));
}
return self;
}
@end
```


**答案：**

都输出 Son

NSStringFromClass([self class]) = Son
NSStringFromClass([super class]) = Son



这个题目主要是考察关于 Objective-C 中对 self 和 super 的理解。


我们都知道：self 是类的隐藏参数，指向当前调用方法的这个类的实例。那 super 呢？

很多人会想当然的认为“ super 和 self 类似，应该是指向父类的指针吧！”。这是很普遍的一个误区。其实 super 是一个 Magic Keyword， 它本质是一个编译器标示符，和 self 是指向的同一个消息接受者！他们两个的不同点在于：super 会告诉编译器，调用 class 这个方法时，要去父类的方法，而不是本类里的。


上面的例子不管调用`[self class]`还是`[super class]`，接受消息的对象都是当前 `Son ＊xxx` 这个对象。

当使用 self 调用方法时，会从当前类的方法列表中开始找，如果没有，就从父类中再找；而当使用 super 时，则从父类的方法列表中开始找。然后调用父类的这个方法。


这也就是为什么说“不推荐在 init 方法中使用点语法”，如果想访问实例变量 iVar 应该使用下划线（ `_iVar` ），而非点语法（ `self.iVar` ）。

点语法（ `self.iVar` ）的坏处就是子类有可能覆写 setter 。假设 Person 有一个子类叫 ChenPerson，这个子类专门表示那些姓“陈”的人。该子类可能会覆写 lastName 属性所对应的设置方法：

```Objective-C
//
//  ChenPerson.m
//
//
//  Created by https://github.com/ChenYilong on 15/8/30.
//  Copyright (c) 2015年 http://weibo.com/luohanchenyilong/ 微博@iOS程序犭袁. All rights reserved.
//

#import "ChenPerson.h"

@implementation ChenPerson

@synthesize lastName = _lastName;

- (instancetype)init
{
self = [super init];
if (self) {
NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, NSStringFromClass([self class]));
NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, NSStringFromClass([super class]));
}
return self;
}

- (void)setLastName:(NSString*)lastName
{
//设置方法一：如果setter采用是这种方式，就可能引起崩溃
//    if (![lastName isEqualToString:@"陈"])
//    {
//        [NSException raise:NSInvalidArgumentException format:@"姓不是陈"];
//    }
//    _lastName = lastName;

//设置方法二：如果setter采用是这种方式，就可能引起崩溃
_lastName = @"陈";
NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, @"会调用这个方法,想一下为什么？");

}

@end
```

在基类 Person 的默认初始化方法中，可能会将姓氏设为空字符串。此时若使用点语法（ `self.lastName` ）也即 setter 设置方法，那么调用将会是子类的设置方法，如果在刚刚的 setter 代码中采用设置方法一，那么就会抛出异常，


为了方便采用打印的方式展示，究竟发生了什么，我们使用设置方法二。


如果基类的代码是这样的：


```Objective-C
//
//  Person.m
//  nil对象调用点语法
//
//  Created by https://github.com/ChenYilong on 15/8/29.
//  Copyright (c) 2015年 http://weibo.com/luohanchenyilong/ 微博@iOS程序犭袁. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
self = [super init];
if (self) {
self.lastName = @"";
//NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, NSStringFromClass([self class]));
//NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, self.lastName);
}
return self;
}

- (void)setLastName:(NSString*)lastName
{
NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, @"根本不会调用这个方法");
_lastName = @"炎黄";
}

@end
```

那么打印结果将会是这样的：

```Objective-C
🔴类名与方法名：-[ChenPerson setLastName:]（在第36行），描述：会调用这个方法,想一下为什么？
🔴类名与方法名：-[ChenPerson init]（在第19行），描述：ChenPerson
🔴类名与方法名：-[ChenPerson init]（在第20行），描述：ChenPerson
```

我在仓库里也给出了一个相应的 Demo（名字叫：Demo_21题_下面的代码输出什么）。有兴趣可以跑起来看一下，主要看下他是怎么打印的，思考下为什么这么打印。


接下来让我们利用 runtime 的相关知识来验证一下 super 关键字的本质，使用clang重写命令:


```Objective-C
$ clang -rewrite-objc test.m
```

将这道题目中给出的代码被转化为:


```Objective-C
NSLog((NSString *)&__NSConstantStringImpl__var_folders_gm_0jk35cwn1d3326x0061qym280000gn_T_main_a5cecc_mi_0, NSStringFromClass(((Class (*)(id, SEL))(void *)objc_msgSend)((id)self, sel_registerName("class"))));

NSLog((NSString *)&__NSConstantStringImpl__var_folders_gm_0jk35cwn1d3326x0061qym280000gn_T_main_a5cecc_mi_1, NSStringFromClass(((Class (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){ (id)self, (id)class_getSuperclass(objc_getClass("Son")) }, sel_registerName("class"))));
```

从上面的代码中，我们可以发现在调用 [self class] 时，会转化成 `objc_msgSend`函数。看下函数定义：


```Objective-C
id objc_msgSend(id self, SEL op, ...)
```
我们把 self 做为第一个参数传递进去。

而在调用 [super class]时，会转化成 `objc_msgSendSuper`函数。看下函数定义:


```Objective-C
id objc_msgSendSuper(struct objc_super *super, SEL op, ...)
```

第一个参数是 `objc_super` 这样一个结构体，其定义如下:


```Objective-C
struct objc_super {
__unsafe_unretained id receiver;
__unsafe_unretained Class super_class;
};
```

结构体有两个成员，第一个成员是 receiver, 类似于上面的 `objc_msgSend`函数第一个参数self 。第二个成员是记录当前类的父类是什么。

所以，当调用 ［self class] 时，实际先调用的是 `objc_msgSend`函数，第一个参数是 Son当前的这个实例，然后在 Son 这个类里面去找 - (Class)class这个方法，没有，去父类 Father里找，也没有，最后在 NSObject类中发现这个方法。而 - (Class)class的实现就是返回self的类别，故上述输出结果为 Son。

objc Runtime开源代码对- (Class)class方法的实现:


```Objective-C
- (Class)class {
return object_getClass(self);
}
```

而当调用 `[super class]`时，会转换成`objc_msgSendSuper函数`。第一步先构造 `objc_super` 结构体，结构体第一个成员就是 `self` 。
第二个成员是 `(id)class_getSuperclass(objc_getClass(“Son”))` , 实际该函数输出结果为 Father。

第二步是去 Father这个类里去找 `- (Class)class`，没有，然后去NSObject类去找，找到了。最后内部是使用 `objc_msgSend(objc_super->receiver, @selector(class))`去调用，

此时已经和`[self class]`调用相同了，故上述输出结果仍然返回 Son。


参考链接：[微博@Chun_iOS](http://weibo.com/junbbcom)的博文[刨根问底Objective－C Runtime（1）－ Self & Super](http://chun.tips/blog/2014/11/05/bao-gen-wen-di-objective%5Bnil%5Dc-runtime(1)%5Bnil%5D-self-and-super/)

