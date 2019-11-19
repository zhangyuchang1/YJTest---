//
//  YJViewRemoveController.m
//  YJTest
//
//  Created by zyc on 2019/11/18.
//  Copyright © 2019 zyc. All rights reserved.
//

#import "YJViewRemoveController.h"
#import "YJTestRemoveView.h"

@interface YJViewRemoveController ()

@end

@implementation YJViewRemoveController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    YJTestRemoveView *v = [[YJTestRemoveView alloc] initWithFrame:CGRectMake(20, 50, 200, 80)];
    [self.view addSubview:v];
    

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
