//
//  BassButton2.m
//  YJTest
//
//  Created by mac on 2017/7/19.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "BassButton2.h"

@implementation BassButton2

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



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


-(void)layoutSubviews
{
    [super layoutSubviews];
    //
    
    self.backgroundColor = [UIColor redColor];
    
    self.left = 15;
    self.width = [UIScreen mainScreen].bounds.size.width - 30;
    self.height = 45;
    
    self.backgroundColor = [UIColor greenColor];
    self.layer.cornerRadius = 22.5;
    self.layer.masksToBounds = YES;
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    
    
}



@end
