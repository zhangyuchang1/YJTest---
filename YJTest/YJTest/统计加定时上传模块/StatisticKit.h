//
//  StatisticKit.h
//  GameMall
//
//  Created by zyc on 16/6/6.
//  Copyright © 2016年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, StatisType)
{
    /** 日活 */
    StatisticType_UserDailyActivity = 900000,
    /** 激活 */
    StatisticType_Activate = 800000

};
@interface StatisticKit : NSObject
/**
 *  统计一个事件
 *
 *  @param type 事件编号
 *  @param info 事件详情id字典 如@{@"uid":@"100001"} 非必填参数
 */
+ (void)statistic:(StatisType)type;

@end
