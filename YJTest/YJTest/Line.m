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

    [self reSizeToLine];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self reSizeToLine];
}
- (void)reSizeToLine
{
    CGPoint point = self.frame.origin;
    CGSize size = self.frame.size;
    
    if (size.height > 2) { //横线
        self.frame = CGRectMake(point.x, point.y, size.width, 0.5);
        
    }else{ //竖线
        self.frame = CGRectMake(point.x, point.y, 0.5, size.height);
        
    }

}

@end
