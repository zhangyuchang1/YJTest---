//
//  YJTestScrollManager.m
//  YJTest
//
//  Created by zyc on 2018/1/4.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "YJTestScrollManager.h"

#define scroll_offset_y  @"contentOffset.y"

@interface YJTestScrollManager()
{
    BOOL _canScroll_bg;
    BOOL _canScroll_fg;

    
}
@property(nonatomic,strong) UIScrollView *bgScrollView;
@property(nonatomic,strong) UIScrollView *fgScrollView;

@end
@implementation YJTestScrollManager

-(instancetype)initWithBackground:(UIScrollView *)bgScrollView  foreground:(UIScrollView *)fgScrollView
{
    self = [super init];
    if (self) {
        self.bgScrollView = bgScrollView;
        self.fgScrollView = fgScrollView;
        [self config];
    }
    
    return self;
}
-(void)config
{
    //    [button addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];

//    self.bgScrollView.frame
    _canScroll_bg = YES;
    _canScroll_fg = NO;
    
    [self.bgScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
//    [self.fgScrollView addObserver:self forKeyPath:scroll_offset_y options:NSKeyValueObservingOptionNew context:nil];
//    self.fgScrollView.scrollEnabled = NO;
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    
    if (object == self.bgScrollView) {
        
        NSValue *pointValue = change[@"new"];
        CGPoint point = [pointValue CGPointValue];
        CGFloat y = point.y;
        
        NSLog(@"bgScrollView - %f",y);
        
        if (y == _bgScrollThreshold) {
            return;
        }
        if (y >= _bgScrollThreshold) {
            
            self.bgScrollView.contentOffset =  CGPointMake(0, _bgScrollThreshold);
            
            _canScroll_fg = YES;
            _canScroll_bg = NO;
            
        }else{
            
            if (!_canScroll_bg) {
                self.bgScrollView.contentOffset =  CGPointMake(0, _bgScrollThreshold);

            }
            
        }
        
        
        
        
        
        
    }else if(object == self.fgScrollView){
        
        NSValue *pointValue = change[@"new"];
        CGPoint point = [pointValue CGPointValue];
        CGFloat y = point.y;
        
        NSLog(@"fgScrollView - %f",y);
        
        
        if (y == 0) {
            return;
        }
        
        if (!_canScroll_fg) {
            self.fgScrollView.contentOffset = CGPointZero;
        }

        if (y <= 0) {

            self.fgScrollView.contentOffset = CGPointZero;
            _canScroll_bg = YES;
            _canScroll_fg = NO;
            
        }else{
            
            
        }
        
        
    }
    
//    NSInteger value = [change[scroll_offset_y] integerValue];
//
//    NSLog(@"%d",value);

    
    
    
}

-(void)state1
{
    
}

-(void)dealloc
{
    //移除观察者 必须写在观察着里面， button为nil时也没关系
    [self.bgScrollView removeObserver:@"contentOffset" forKeyPath:scroll_offset_y];
    
//    [self.bgScrollView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];

//    [self.fgScrollView removeObserver:self forKeyPath:scroll_offset_y];

}

@end
