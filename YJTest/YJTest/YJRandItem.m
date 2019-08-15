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

/// 柱子
@property (nonatomic,strong) UIView *gressView;
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
    self.rat = 1.0;
//    self.backgroundColor = [UIColor purpleColor];
    
    self.coutLabel = ({
        UILabel *label =[[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, [YJRandItem width], 20);
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor redColor];
        [self addSubview:label];
        label;
    });
    self.gressView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [YJRandItem width], 0)];
        view.backgroundColor = [UIColor brownColor];
        [self addSubview:view];
        view;
    });
    self.numberLabel = ({
        UILabel *label =[[UILabel alloc] init];
        label.frame = CGRectMake(0, [YJRandItem height] - 20, [YJRandItem width], 20);
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        label;
    });
}

-(void)setNumber:(int)number
{
    _number = number;
    self.numberLabel.text = [NSString stringWithFormat:@"%d",number];
}
-(void)setTimes:(int)times
{
    _times = times;
    self.coutLabel.text = [NSString stringWithFormat:@"%d",times];
    self.gressView.height = times*_rat;
}

// 宽度
+ (CGFloat)width
{
    return 30;
}

// 最大高度
+ (CGFloat)height
{
    return 200;
}

// 间距
+ (CGFloat)space
{
    return 30;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat gressHeight = self.times*_rat;

    while (gressHeight > self.height - self.coutLabel.height - self.numberLabel.height) { //超出父视图
        self.rat *= 0.8; //缩小比例
        gressHeight = self.times*_rat;
    }
    
    self.gressView.height = gressHeight;
    self.gressView.bottom = self.numberLabel.top;
    self.coutLabel.bottom = self.gressView.top;
}


@end
