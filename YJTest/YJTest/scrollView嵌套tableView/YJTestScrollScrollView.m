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
    
    UICollectionView
    
    UITableView *tableView;
    if ([otherGestureRecognizer.view isKindOfClass:[UITableView class]]) {
        tableView = (UITableView *)otherGestureRecognizer.view;
    }
    
    if (!tableView) {
        return YES;
    }
    
    CGFloat scroll_touchY =  [gestureRecognizer locationInView:self].y;
    
    CGFloat table_touchY =  [gestureRecognizer locationInView:tableView].y;
    
    if (table_touchY <= 0) {
        
        otherGestureRecognizer.enabled = NO;
        return YES;
    }
    
    if (self.contentOffset.y < tableView.frame.origin.y) {
        
        otherGestureRecognizer.enabled = NO;
        return YES;
    }else{
        return NO;
    }
    
    
    return YES;
}
@end
