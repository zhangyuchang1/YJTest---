//
//  GCDTestViewController.m
//  YJTest
//
//  Created by mac on 2017/6/24.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "GCDTestViewController.h"

@interface GCDTestViewController ()

@end

@implementation GCDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    // 1. 子线程到主线程
    // 2. 延迟调用
    // 3. 定时器
    // 4. 单例
    

 
    
    
}

-(void)test1
{
    // 看看打印顺序
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2), dispatch_get_main_queue(), ^{
       
        NSLog(@"123");
        
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"456");
    });
    
    NSLog(@"789");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self test2];
}


- (void)test2 {
    
    // 看看打印顺序
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"Hello");
        
        // 注意这两个方法 结果会不一样
        // 这个方法 在runloop里面注册了一个timer
        [self performSelector:@selector(dosomething) withObject:nil afterDelay:0];
        [self performSelector:@selector(dosomething) withObject:nil ];

        NSLog(@"ZS");
        
        NSLog(@"当前线程 ：%@",[NSThread currentThread]);
        
    });
}

- (void)dosomething
{
    NSLog(@"Logic");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
