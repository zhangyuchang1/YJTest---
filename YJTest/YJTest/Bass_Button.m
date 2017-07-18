//
//  Bass_Button.m
//  YJTest
//
//  Created by mac on 2017/7/19.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "Bass_Button.h"

@interface Bass_Button()

@property(nonatomic,strong) UIButton *button;
@end



@implementation Bass_Button


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.



-(void)layoutSubviews
{
    [super layoutSubviews];
//
    
    self.backgroundColor = [UIColor redColor];

    if (!self.button)
    {
        self.button = [[UIButton alloc] init];
        [self addSubview:self.button];
    }
    else
    {
        NSLog(@"");
    }
    self.button.left = 15;
    self.button.width = [UIScreen mainScreen].bounds.size.width - 30;
    self.button.height = 45;
    
    self.button.backgroundColor = [UIColor greenColor];
    self.button.layer.cornerRadius = 22.5;
    self.button.layer.masksToBounds = YES;
    
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];


    
    
}
- (void)drawRect:(CGRect)rect {

    [super drawRect:rect];
    
    
//    self.backgroundColor = [UIColor redColor];
//    if (!self.button)
//    {
//        self.button = [[UIButton alloc] init];
//        [self addSubview:self.button];
//    }
//    else
//    {
//        NSLog(@"");
//    }
//    self.button.left = 15;
//    self.button.width = [UIScreen mainScreen].bounds.size.width - 30;
//    self.button.height = 45;
//    
//    self.button.backgroundColor = [UIColor greenColor];
//    self.button.layer.cornerRadius = 22.5;
//    self.button.layer.masksToBounds = YES;
//    
//    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    

}

@end
