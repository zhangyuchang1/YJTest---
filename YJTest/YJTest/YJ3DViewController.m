//
//  3DViewController.m
//  YJTest
//
//  Created by zyc_hdj on 2018/9/6.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "YJ3DViewController.h"
#import "HSF3DModelView.h"

@interface YJ3DViewController ()

@end

@implementation YJ3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    HSF3DModelView *testV = [[HSF3DModelView alloc] initWithFrame:CGRectMake(20, 100, 200, 200)];
    [self.view addSubview:testV];
    
    
    
    //test
    NSDictionary *dic = [NSDictionary dictionary];
    NSString *str = dic[@"test"];
    NSLog(@"%@",str);
    
    int aa  = [str intValue];
    NSNumber *num = @(aa);
    NSLog(@"%@",num);
    
    
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
