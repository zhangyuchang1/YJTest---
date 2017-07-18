//
//  NewView.m
//  YJTest
//
//  Created by zyc on 16/2/27.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "NewView.h"

@implementation NewView

-(void)load
{
    
}

// ************ 写这里没用 **********
//-(instancetype)init
//{
//    self = [super init];
//    if (self) {
//       
//        UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//        la.text = @"佳佳";
//        la.backgroundColor = [UIColor redColor];
//        [self addSubview:la];
//        
//    }
//    return self;
//}

//-(instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//        self = [super init];
//        if (self) {
//    
//            UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//            la.text = @"佳佳";
//            la.backgroundColor = [UIColor redColor];
//            [self addSubview:la];
//    
//        }
//        return self;
//
//    
//}
//
////************ 写这里也不能实时显示 **********
//- (void)awakeFromNib
//{
//    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 80, 30)];
//    la.textAlignment = NSTextAlignmentCenter;
//    la.text = @"佳佳";
//    la.backgroundColor = [UIColor blueColor];
//    [self addSubview:la];
//}
//

//********** 必须写 layoutSubviews 和  drawRect  或 任意一个 **************
-(void)layoutSubviews
{
    [super layoutSubviews];
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 80, 30)];
    la.textAlignment = NSTextAlignmentCenter;
    la.text = @"佳佳";
    la.backgroundColor = [UIColor yellowColor];
    [self addSubview:la];
}

- (void)drawRect:(CGRect)rect {

    [super drawRect:rect];
    
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    la.textAlignment = NSTextAlignmentCenter;
    la.text = @"佳佳";
    la.backgroundColor = [UIColor redColor];
    [self addSubview:la];

}

@end
