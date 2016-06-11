//
//  YJStatisticController.m
//  YJTest
//
//  Created by zyc on 16/6/11.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "YJStatisticController.h"
#import "StatisticKit.h"

@interface YJStatisticController ()

@end

@implementation YJStatisticController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"statistic.plist"];

   NSLog(@"统计记录路径 - %@ ",filename);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)statistic_1:(UIButton *)sender {
    
    NSLog(@"统计 1 - 日活");
    
    [StatisticKit statistic:StatisticType_UserDailyActivity];
    
    
}
- (IBAction)statistic_2:(UIButton *)sender {
    
    NSLog(@"统计 2 - 事件点击");
    
    [StatisticKit statistic:StatisticType_Activate];


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
