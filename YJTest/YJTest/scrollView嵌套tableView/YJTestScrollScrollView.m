//
//  YJTestScrollScrollView.m
//  YJTest
//
//  Created by mac on 2017/9/7.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "YJTestScrollScrollView.h"

@implementation YJTestScrollScrollView

#pragma mark - UIGestureRecognizerDelegate

//开始进行手势识别时调用的方法，返回NO则结束识别，不再触发手势，用处：可以在控件指定的位置使用手势识别
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

//是否支持多手势触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥 。默认为NO
//是否允许多个手势识别器共同识别，一个控件的手势识别后是否阻断手势识别继续向下传播，默认返回NO；如果为YES，响应者链上层对象触发手势识别后，如果下层对象也添加了手势并成功识别也会继续执行，否则上层对象识别后则不再继续传播

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {

    //    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UICollectionView")]) {
    //
    //        if ([otherGestureRecognizer.view.className isEqualToString:@"JHHomeCollectionView"]) {
    //            return YES;
    //        }
    //    }

    UIView *view1 = gestureRecognizer.view;
    CGPoint point1_in_view1 = [gestureRecognizer locationInView:view1];


    UIView *view2 = otherGestureRecognizer.view;
    CGPoint point2_in_view2 = [otherGestureRecognizer locationInView:view2];


    CGPoint point1_in_view2 = [gestureRecognizer locationInView:view2];
    CGPoint point2_in_view1 = [gestureRecognizer locationInView:view2];



//    return NO;
    return YES;
}
@end
