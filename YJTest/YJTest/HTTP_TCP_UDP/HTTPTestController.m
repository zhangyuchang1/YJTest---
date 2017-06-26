//
//  HTTPTestController.m
//  YJTest
//
//  Created by mac on 2017/6/25.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "HTTPTestController.h"

@interface HTTPTestController ()

@end

@implementation HTTPTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* 请求方式
     NSURLConnection：用法简单，最古老最经典最直接的一种方案
     NSURLSession：功能比NSURLConnection更加强大，苹果目前比较推荐使用这种技术（2013推出，iOS7开始使用的技术）
     CFNetwork：NSURL*的底层，纯C语言
     
     第三方框架
     AFNetworking：简单易用，提供了基本够用的常用功能，维护和使用者多
     ASIHttpRequest：外号“HTTP终结者”，功能极其强大，可惜早已停止更新
     MKNetworkKit：简单易用，产自印度，维护和使用者少
     
     */
    
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
