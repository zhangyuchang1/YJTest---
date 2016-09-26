//
//  UIView+CornerBorder.h
//  YJTest
//
//  Created by mac on 16/9/22.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CornerBorder)
+ (UIImage *)imageWithSize:(CGSize)size radius:(CGFloat)radius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor;


@end
