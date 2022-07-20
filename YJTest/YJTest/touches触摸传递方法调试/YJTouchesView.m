//
//  YJTouchesView.m
//  YJTest
//
//  Created by zyc on 2022/7/20.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "YJTouchesView.h"

@implementation YJTouchesView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 这里可以让上级试图也响应事件
    [self.nextResponder touchesBegan:touches withEvent:event];
    
    NSLog(@"%@ -- touchesBegan ", [self class]);

}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 表示自己不处理事件，让内部子级控件去处理
    return [super hitTest:point withEvent:event];

    // 表示自己不处理事件，让上级控件去处理
    return nil;
}
//
- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event
{
    return YES;
}

// 这个是 scrollView的方法，可以处理 scrollView套scrollView的滑动 ，在这里没用
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
@end
