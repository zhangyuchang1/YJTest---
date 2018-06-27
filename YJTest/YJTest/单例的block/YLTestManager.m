//
//  YLTestManager.m
//  YJTest
//
//  Created by zyc_hdj on 2018/6/5.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "YLTestManager.h"

@interface YLTestManager()
{
    dispatch_source_t _timer;   // 要写成self持有

    NSMutableArray < void (^)(void)>*_blocks;
}
@end
@implementation YLTestManager
+ (YLTestManager *)sharedManager {
    static YLTestManager *manager = nil;
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        if (manager == nil) {
            manager = [[YLTestManager alloc] init];
            [manager config];
        }
    });
    
    return manager;
}

/// 测试 5s 回调一次
-(void)config
{
    _blocks = [NSMutableArray array];
    
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(_timer, ^{
        
        
        [self callBack];
        
    });
    dispatch_resume(_timer);
    
}

-(void)setBlock:(void (^)(void))block
{
    if (![_blocks containsObject:block]) {
        
        [_blocks addObject:block];
    }
}

-(void)callBack
{
    for (void (^block)(void) in _blocks) {
        
        if (block) {
            block();
        }
    }
}

@end
