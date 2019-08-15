//
//  YJRandItem.h
//  YJTest
//
//  Created by zyc_hdj on 2019/8/15.
//  Copyright © 2019 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

//NS_ASSUME_NONNULL_BEGIN

/// 显示 一个数字在扔的过程中出现了多少次
@interface YJRandItem : UIView

/// 比例 默认1：1 ，显示不下比例调低
@property (nonatomic,assign) float rat;

/// 出现的次数
@property (nonatomic,assign) int times;

/// 随机的数字
@property (nonatomic,assign) int number;


// 宽度
+ (CGFloat)width;

// 最大高度
+ (CGFloat)height;

// 间距
+ (CGFloat)space;


@end

//NS_ASSUME_NONNULL_END
