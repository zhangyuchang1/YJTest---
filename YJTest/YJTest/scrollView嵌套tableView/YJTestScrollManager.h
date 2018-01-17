//
//  YJTestScrollManager.h
//  YJTest
//
//  Created by zyc on 2018/1/4.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 两个scrollView 滑动管理，监听两个滑动并设可否滑
@interface YJTestScrollManager : NSObject

/// 指背景scrollView 滑动到此值，前景scrollView接着滑
@property (nonatomic,assign) CGFloat bgScrollThreshold;

-(instancetype)initWithBackground:(UIScrollView *)bgScrollView  foreground:(UIScrollView *)fgScrollView;

@end
