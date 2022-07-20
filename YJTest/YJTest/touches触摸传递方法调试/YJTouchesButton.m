//
//  YJTouchesButton.m
//  YJTest
//
//  Created by zyc on 2022/7/20.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "YJTouchesButton.h"

@implementation YJTouchesButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [super touchesBegan:touches withEvent:event]; // 这句没用
    //touchesBegan 由子控件开始传递
    NSLog(@"%@ -- touchesBegan ", [self class]);
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//
//    return self;
//}
//
//- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event
//{
//    return YES;
//}

@end
