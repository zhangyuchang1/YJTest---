//
//  YJTestViewController.m
//  YJTest
//
//  Created by zyc on 16/1/26.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "YJTestViewController.h"
#import "YJTestButton.h"
@implementation YJTestViewController


-(void)viewDidLoad{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button.backgroundColor = [UIColor redColor];
    NSLog(@"%@",self);
    NSLog(@"内存地址1：%p",self);
    NSLog(@"内存地址2：%x",&self);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    YJTestButton *yjButton = [[YJTestButton alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
    yjButton.backgroundColor = [UIColor greenColor];
    yjButton.tag = 111;
    [self.view addSubview:yjButton];
    NSLog(@"内存地址1：%p",yjButton);

    
    UIButton *button_remove = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 40)];
    button_remove.backgroundColor = [UIColor redColor];
    [button_remove setTitle:@"删除YJbutton" forState:UIControlStateNormal];
    [button_remove addTarget:self action:@selector(removeYJButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_remove];
    
    
    UIButton *button_4 = [[UIButton alloc] initWithFrame:CGRectMake(100, 360, 100, 40)];
    button_4.backgroundColor = [UIColor purpleColor];
    [button_4 setTitle:@"doNothing" forState:UIControlStateNormal];
    [button_4 addTarget:self action:@selector(doNothing) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_4];
}
-(void)doNothing
{
    
}
-(void)removeYJButton
{
    YJTestButton *yjButton = [self.view viewWithTag:111];
    [yjButton removeFromSuperview];
}
-(void)back
{
    
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    
}

-(void)dealloc
{
}
@end
