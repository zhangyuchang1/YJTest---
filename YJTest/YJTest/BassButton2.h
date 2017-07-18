//
//  BassButton2.h
//  YJTest
//
//  Created by mac on 2017/7/19.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+YJ.m"
IB_DESIGNABLE

@interface BassButton2 : UIButton

// 拓展IB属性
@property (nonatomic,assign) IBInspectable CGFloat cornerRadius;

@property (nonatomic,retain) IBInspectable UIColor *radiusColor;

@property (nonatomic,assign) IBInspectable CGFloat radiusWidth;

@end
