//
//  YLTestManager.h
//  YJTest
//
//  Created by zyc_hdj on 2018/6/5.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLTestManager : NSObject

@property(nonatomic,copy) void(^block)(void);

+ (YLTestManager *)sharedManager;

@end
