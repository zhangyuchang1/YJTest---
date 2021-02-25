//
//  YLSingtonViewController.m
//  YJTest
//
//  Created by zyc_hdj on 2018/6/5.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "YLSingtonViewController.h"
#import "YLTestManager.h"

@interface YLSingtonViewController ()
{
}
@property (nonatomic,assign) NSInteger flag;
@end

@implementation YLSingtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _flag = 99;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)set1:(UIButton *)sender {
    
    
    UIImagePickerController  *picker = [[UIImagePickerController alloc] init];
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    
    
    
    return;
    [YLTestManager sharedManager].block = ^{
      
        
        NSLog(@"%zd --- 1",self.flag);
        
    };
    
}
- (IBAction)set2:(UIButton *)sender {
    
    [YLTestManager sharedManager].block = ^{
        
        
        NSLog(@"%zd --- 2",self.flag);
        
    };
    
}

-(void)dealloc
{
    NSLog(@"release");
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
