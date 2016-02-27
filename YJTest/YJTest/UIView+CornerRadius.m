//
//  UIView+CornerRadius.m
//  YJTest
//
//  Created by zyc on 16/2/27.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
;
}
-(CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

-(void)setRadiusColor:(UIColor *)radiusColor
{
    self.layer.borderColor = radiusColor.CGColor;
    
}
-(UIColor *)radiusColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

-(void)setRadiusWidth:(CGFloat)radiusWidth
{
    self.layer.borderWidth = radiusWidth;
}
-(CGFloat)radiusWidth
{
    return self.layer.borderWidth;
}


@end
