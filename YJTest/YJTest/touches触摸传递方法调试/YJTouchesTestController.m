//
//  YJTouchesTestController.m
//  YJTest
//
//  Created by zyc on 2022/7/20.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "YJTouchesTestController.h"
#import "YJTouchesView.h"
#import "YJTouchesButton.h"

@interface YJTouchesTestController ()

@end

@implementation YJTouchesTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addsubViews];
}


- (void)addsubViews {
    YJTouchesView *touchesView = [[YJTouchesView alloc] initWithFrame:CGRectMake(30, 180, (self.view.width-60)/2, 150)];
    touchesView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:touchesView];
    
    YJTouchesButton *touchesButton = [[YJTouchesButton alloc] initWithFrame:CGRectMake(20, 20, (touchesView.width - 40)/2.0, 110)];
    touchesButton.backgroundColor = [UIColor redColor];
    [touchesView addSubview:touchesButton];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ -- touchesBegan ", [self class]);
}

/*
        结论 （没有加hitTest方法下）
    1. touchesBegan方法由子控件最先接受处理
    2. 重叠控件只会实现一个touchesBegan方法
    3. 子控件有实现方法，上级控件不会收到方法
    4. 当子类没有实现touchesBegan方法，会逐级从上级控件找，有实现touchesBegan方法的会调用
    5. 用 self.nextResponder 可以拿到上级控件，可以让上级控件同时也响应事件
 
 
    
    touchesBegan 是UIResponder的方法 ，hitTest 是UIView的方法
 
    hitTest 的处理优先级要高于 touchesBegan，hitTest可以控制哪个控件响应事件
    使用方法见YJTouchesView
 
 */



@end
