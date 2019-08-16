//
//  YJRandViewController.h
//  YJTest
//
//  Created by zyc_hdj on 2019/8/15.
//  Copyright © 2019 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJRandItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJRandViewController : UIViewController

// 测试看rand()随机是不是假的，能不能达到随机效果

// 指定n个随机数，随机扔一个其中数字，这个数字的计数+1，重复1000次看看随机数字的各个计数

// 结论 每次结果不同, 计数大致平均？  , 可达随机效果
@end

NS_ASSUME_NONNULL_END
