//
//  RunloopTestController.m
//  YJTest
//
//  Created by mac on 2017/6/24.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "RunloopTestController.h"

@interface RunloopTestController ()

@end

@implementation RunloopTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UITextView *text = [[UITextView alloc] initWithFrame:self.view.bounds];
    text.text = @"SDK雷锋精神考虑到福建公司考虑到甲方公司考虑到福建高速来电看房价格时口袋里放假高速路口的";
    [self.view addSubview:text];
    
    
    // runloop 是一个死循环
    // 作用： 1.保证线程不退出
    //       2.负责监听事件
    
    // 时钟
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    NSTimer *timer =  [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    // NSRunLoopCommonModes 相当于UITrackingRunLoopMode + NSDefaultRunLoopMode
    // 可解决 触摸影响timer事件
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

    // 子线程中的timer ,结论:[[NSRunLoop currentRunLoop] run]才会启动,而且触摸操作不会影响
    /*
    dispatch_queue_t queque = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queque, ^{
       
       NSTimer *timer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
    });
    */
    
    // 其中：source0指的是非系统内核，说白了也就是处理触摸事件，selector事件，source1指的是基于端口的port：是处理系统的一些事件
    // CFRunloop
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)timerMethod
{
    // 耗时操作
    [NSThread sleepForTimeInterval:1];
    
    static int a = 0;
    a++;
    NSLog(@"%@ --- %d",[NSThread currentThread], a);
}

- (void)dealloc
{
    NSLog(@"我死了");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
