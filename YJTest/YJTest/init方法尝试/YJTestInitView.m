//
//  YJTestInitView.m
//  YJTest
//
//  Created by zyc_hdj on 2018/5/22.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "YJTestInitView.h"

@implementation YJTestInitView


-(instancetype)init
{
    self = [super init];
    
    if (self) {
        // custom
        NSLog(@"do someth");
    }
    
    return self;
}

-(instancetype)initWithObj:(NSObject *)obj
{
    
    //
//    self = [super init];
    
    // 这样写不会有问题
    self = [self init];
    
    if (self) {
        
    }
    
    return self;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
