//
//  UIView+DDAddition.h
//  eDuShi
//
//  Created by 郑凯 on 15-2-27.
//  Copyright (c) 2015年 aladdin. All rights reserved.
//

#import <UIKit/UIKit.h>

// 增加一些好用的基本属性

@interface UIView (DDAddition)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;


/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 * 返回当前视图下的 第一个指定类型 子视图
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 * 返回当前视图父视图中 第一个指定类型的 父视图
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 * 移除当前视图下的所有子视图
 */
- (void)removeAllSubviews;

/**
 * The view controller whose view contains this view.
 * 获取当前视图的控制器
 */
- (UIViewController*)viewController;

/**
 * 给View加上圆角和边框
 */
- (UIView *)roundedCornerAndBorderView;

/**
 * 通过Tag获取子视图
 */
- (id)subviewWithTag:(NSInteger)tag;
@end


