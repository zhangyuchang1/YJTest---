//
//  XIBConfiViewController.m
//  YJTest
//
//  Created by zyc on 16/2/27.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "XIBConfiViewController.h"
#import "Bass_Button.h"

@interface XIBConfiViewController ()


@property (weak, nonatomic) IBOutlet Bass_Button *bassButn;





@end

@implementation XIBConfiViewController



- (IBAction)hh:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = YES;

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
