//
//  NewView.m
//  YJTest
//
//  Created by zyc on 16/2/27.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "NewView.h"

@implementation NewView

-(void)load
{
    
}

// ************ 写这里没用 **********
//-(instancetype)init
//{
//    self = [super init];
//    if (self) {
//       
//        UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//        la.text = @"佳佳";
//        la.backgroundColor = [UIColor redColor];
//        [self addSubview:la];
//        
//    }
//    return self;
//}


- (void)drawRect:(CGRect)rect {

    [super drawRect:rect];
    
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    la.textAlignment = NSTextAlignmentCenter;
    la.text = @"佳佳";
    la.backgroundColor = [UIColor redColor];
    [self addSubview:la];

}

@end
