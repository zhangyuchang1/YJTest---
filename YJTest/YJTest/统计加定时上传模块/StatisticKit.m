//
//  StatisticKit.m
//  GameMall
//
//  Created by zyc on 16/6/6.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "StatisticKit.h"
#import "StatisticManager.h"

@implementation StatisticKit
+ (void)statistic:(StatisType)type
{
    dispatch_queue_t  queue1 =  dispatch_queue_create ( "com.dispatch.annotationPlay" ,  DISPATCH_QUEUE_SERIAL );
    dispatch_async(queue1, ^{
        
        [[StatisticManager sharedManager] addStatistic:type];
        
    });
}


@end
