//
//  YJTestScrollScrollView.m
//  YJTest
//
//  Created by mac on 2017/9/7.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "YJTestScrollScrollView.h"

@implementation YJTestScrollScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    //    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UICollectionView")]) {
    //
    //        if ([otherGestureRecognizer.view.className isEqualToString:@"JHHomeCollectionView"]) {
    //            return YES;
    //        }
    //    }
    
    
    return YES;
}
@end
