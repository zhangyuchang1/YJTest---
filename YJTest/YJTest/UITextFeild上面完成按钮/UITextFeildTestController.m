//
//  UITextFeildTestController.m
//  YJTest
//
//  Created by zyc on 2017/11/8.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "UITextFeildTestController.h"

@interface UITextFeildTestController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation UITextFeildTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *textF = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 200, 80)];
    textF.backgroundColor = [UIColor greenColor];
    [self.view addSubview:textF];
    
    
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
