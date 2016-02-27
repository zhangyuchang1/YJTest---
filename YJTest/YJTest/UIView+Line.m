//
//  UIView+Line.m
//  YJTest
//
//  Created by zyc on 16/2/27.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "UIView+Line.h"

@implementation UIView (Line)

-(void)setIsLine:(BOOL)isLine
{
    if (isLine) {
        CGPoint point = self.frame.origin;
        CGSize szie = self.frame.size;
        
        self.frame = CGRectMake(point.x, point.y, szie.width, 0.5);
    }
}
-(BOOL)isLine
{
    CGFloat h = self.frame.size.height;
    return h=0.5;
}

/*
-(void)layoutSubviews
{
    if (self.isLine) {
        CGPoint point = self.frame.origin;
        CGSize szie = self.frame.size;
        
        self.frame = CGRectMake(point.x, point.y, szie.width, 0.5);
    }
}

-(void)drawRect:(CGRect)rect
{
    if (self.isLine) {
        CGPoint point = self.frame.origin;
        CGSize szie = self.frame.size;
        
        self.frame = CGRectMake(point.x, point.y, szie.width, 0.5);
    }
}
 
 */

@end
