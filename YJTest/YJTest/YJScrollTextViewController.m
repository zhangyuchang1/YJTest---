//
//  YJScrollTextViewController.m
//  YJTest
//
//  Created by zyc on 16/2/27.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "YJScrollTextViewController.h"
#import "YJScrollLabel.h"
@interface YJScrollTextViewController ()

@end

@implementation YJScrollTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
    YJScrollLabel *scrollLabel1 = [[YJScrollLabel alloc] initWithFrame:CGRectMake(30, 100, self.view.bounds.size.width - 60, 44) title:@"叽叽复叽叽，木兰当户织；不闻机杼声，惟闻女叹息" speed:3];
    scrollLabel1.textColor = [UIColor redColor];
    [self.view addSubview:scrollLabel1];
    
    
    YJScrollLabel *scrollLabel2 = [[YJScrollLabel alloc] initWithFrame:CGRectMake(10, 200, self.view.bounds.size.width - 20, 44) title:@"想变成一个ATM机，开心时，吐钱，不开心时，吞卡" speed:10];
    //    scrollLabel2.speed = 8;
    scrollLabel2.space = 100;
    scrollLabel2.backgroundColor = [UIColor purpleColor];
    scrollLabel2.isAllwaysAnimate = YES;
    [self.view addSubview:scrollLabel2];
//
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
