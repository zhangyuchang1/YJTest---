//
//  StatisticManager.h
//  GameMall
//
//  Created by zyc on 16/6/6.
//  Copyright © 2016年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatisticKit.h"
/**
 *  用户行为统计管理器
 */
@interface StatisticManager : NSObject

/**
 *  用户日活是否已上传
 */
@property (nonatomic,assign,readonly) BOOL isDailyStatisticed;
/**
 *  统计列表  eg. 
 */
@property (nonatomic,retain,readonly) NSMutableArray *list;
/**
 *  手机对应服务器上的设备码
 */
@property (nonatomic,copy) NSString *uniqueId;
/**
 *  单实例
 *
 *  @return StatisticManager单实例
 */
+ (StatisticManager *)sharedManager;

/**
 *  增加一条统计信息
 *
 *  @param statistic 统计信息
 */
- (void)addStatistic:(StatisType)statistic;

@end
