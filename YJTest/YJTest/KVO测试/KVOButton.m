//
//  KVOButton.m
//  YJTest
//
//  Created by zyc on 16/7/7.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "KVOButton.h"
#import "UIView+DDAddition.m"

@implementation KVOButton


-(void)dealloc
{
    //不能写到这里， 应该写到观察着里面
    [self  removeObserver:self.viewController forKeyPath:@"value"];
    
    
    UIViewController *VC= self.viewController;
    NSLog(@"");
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


- (void)addKVO
{
    [self addObserver:self.viewController forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)removeKVVO
{
        [self  removeObserver:self.viewController forKeyPath:@"value"];
    
}
- (void)changeValue
{
    self.value ++;
    
    if (self.value == 6) {
        
        [self removeFromSuperview];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
