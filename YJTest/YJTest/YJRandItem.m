//
//  YJRandItem.m
//  YJTest
//
//  Created by zyc_hdj on 2019/8/15.
//  Copyright © 2019 zyc. All rights reserved.
//

#import "YJRandItem.h"

@interface YJRandItem()
{
    // 宽度
//    CGFloat wid;
    
}

/// 次数
@property (nonatomic,strong) UILabel *coutLabel;
/// 随机的数字
@property (nonatomic,strong) UILabel *numberLabel;


@end

@implementation YJRandItem

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

- (void)config
{
    
}

// 宽度
+ (CGFloat)width
{
    return 30;
}

// 最大高度
+ (CGFloat)height
{
    return 30;
}

// 间距
+ (CGFloat)space
{
    return 30;
}




@end
