//
//  YJTestFrameTabarController.m
//  YJTest
//
//  Created by zyc on 16/6/16.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "YJTestFrameTabarController.h"
#import "YJTestFrame_AController.h"
#import "YJTestFrame_BController.h"
#import "YJTestFrame_CController.h"
#import "YJTestFrame_DController.h"



@interface YJTestFrameTabarController ()

@end

@implementation YJTestFrameTabarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    YJTestFrame_AController *aC = [[YJTestFrame_AController alloc] init];
    UINavigationController *aNav = [[UINavigationController alloc] initWithRootViewController:aC];

    YJTestFrame_BController *bC = [[YJTestFrame_BController alloc] init];
    UINavigationController *bNav = [[UINavigationController alloc] initWithRootViewController:bC];
    
    YJTestFrame_CController *cC = [[YJTestFrame_CController alloc] init];
    UINavigationController *cNav = [[UINavigationController alloc] initWithRootViewController:cC];
    
    YJTestFrame_DController *dC = [[YJTestFrame_DController alloc] init];
    UINavigationController *dNav = [[UINavigationController alloc] initWithRootViewController:dC];

    self.viewControllers = @[aNav,bNav,cNav,dNav];
    
    NSMutableArray *items = [NSMutableArray array];
    
    for (int i = 0; i<4; i++) {
            
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:[NSString stringWithFormat:@"%d",i] image:nil tag:i];
        [items addObject:item];
    }
    self.tabBar.items = items;
    
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
