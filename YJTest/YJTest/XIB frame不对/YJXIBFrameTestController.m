//
//  YJXIBFrameTestController.m
//  YJTest
//
//  Created by zyc_hdj on 2018/5/9.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "YJXIBFrameTestController.h"
#import "XIBTestView.h"

@interface YJXIBFrameTestController ()

@end

@implementation YJXIBFrameTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self config];
}

-(void)config
{
    
    
    // 1种情况： self.view 加 xib的view frame 不对
    XIBTestView *testView = [[NSBundle mainBundle] loadNibNamed:@"XIBTestView" owner:self options:nil][0];
    testView.frame = CGRectMake(0, 74, [UIScreen mainScreen].bounds.size.width, 100);
    [self.view addSubview:testView];
    // 经测试 XIBTestView 的XIB 里面的 autoresizing，箭头默认是都有， 把里面的去掉 ，或全部去掉， 显示正常
    
    // 2种情况 self.view 加 scrollView，scrollView 加 xib的view
    
    
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
