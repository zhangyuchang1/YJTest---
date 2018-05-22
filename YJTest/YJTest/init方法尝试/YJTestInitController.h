//
//  YJTestInitController.h
//  YJTest
//
//  Created by zyc_hdj on 2018/5/22.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJTestInitController : UIViewController

// 子类 重写init方法 ，，调其他的初始化方法时 ，会不会走init方法；

// 结论 ： 不会！   可以重写其他的初始化  加上 self = [self init];

@end
