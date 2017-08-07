//
//  YJTestWebBeforeController.m
//  YJTest
//
//  Created by mac on 2017/7/29.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "YJTestWebBeforeController.h"
#import "YJTestWebViewController.h"


@interface YJTestWebBeforeController ()

@end

@implementation YJTestWebBeforeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the Ôview.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, 300, 50)];
    [b addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    b.backgroundColor = [UIColor redColor];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)action
{
    
    
    
    
    YJTestWebViewController *vc = [[YJTestWebViewController alloc] init];
    vc.url = @"http://www.hongdoujiao.com/news/newsDetail?newsId=123";
    
    [self.navigationController pushViewController:vc animated:YES];

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
