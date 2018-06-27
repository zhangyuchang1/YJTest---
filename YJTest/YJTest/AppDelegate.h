//
//  AppDelegate.h
//  YJTest
//
//  Created by zyc on 16/1/25.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


/// master 元

// 工程 添加文件夹 用 new group with folder，可以生成实体文件夹

@end


// 如何保证 使 一段时间内 一个方法只执行一次

// KVO 安全释放 参照 kvocontroller
