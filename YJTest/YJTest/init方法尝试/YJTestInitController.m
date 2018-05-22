//
//  YJTestInitController.m
//  YJTest
//
//  Created by zyc_hdj on 2018/5/22.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "YJTestInitController.h"
#import "YJTestInitView.h"

@interface YJTestInitController ()

@end

@implementation YJTestInitController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    YJTestInitView *imgView = [[YJTestInitView alloc] initWithObj:nil];
    
    [self.view addSubview:imgView];
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
