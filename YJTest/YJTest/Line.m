//
//  Line.m
//  YJTest
//
//  Created by zyc on 16/2/27.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "Line.h"

@implementation Line

- (void)drawRect:(CGRect)rect {
    // Drawing code

    CGPoint point = self.frame.origin;
    CGSize szie = self.frame.size;
    
    self.frame = CGRectMake(point.x, point.y, szie.width, 0.5);
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
//    
    CGPoint point = self.frame.origin;
    CGSize szie = self.frame.size;
    
    self.frame = CGRectMake(point.x, point.y, szie.width, 0.5);
}

@end
