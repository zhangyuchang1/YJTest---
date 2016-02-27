//
//  YJTestButton.m
//  YJTest
//
//  Created by zyc on 16/1/26.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "YJTestButton.h"

@implementation YJTestButton

-(void)remove
{
    [self removeFromSuperview];
}

-(void)dealloc
{
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
@end
