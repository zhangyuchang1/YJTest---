//
//  YJMemeryAddressTestController.m
//  YJTest
//
//  Created by zyc_hdj on 2018/5/3.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "YJMemeryAddressTestController.h"

@interface YJMemeryAddressTestController ()

@property (nonatomic,strong) UIView *subView;

@property (nonatomic,copy) NSString *testString;

@end

@implementation YJMemeryAddressTestController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self test];
}

- (void)test
{
//    https://blog.csdn.net/bryantsikilovia/article/details/46336957
    
    UIView *view1 = [[UIView alloc] init];
    NSLog(@"内存地址1--%@",view1);
    self.subView = view1;
    NSLog(@"内存地址2--%@",self.subView);

    UIView *view3 = self.subView;
    NSLog(@"内存地址3--%@",view3);

    
    NSString *strig1 = @"abc";
    
    self.testString = strig1;
    
    NSLog(@"");

}

// 经过set方法，内存地址不变
-(void)setSubView:(UIView *)subView
{
    _subView = subView ;
    
    
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
