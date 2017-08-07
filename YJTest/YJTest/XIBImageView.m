//
//  XIBImageView.m
//  YJTest
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "XIBImageView.h"

@implementation XIBImageView

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
