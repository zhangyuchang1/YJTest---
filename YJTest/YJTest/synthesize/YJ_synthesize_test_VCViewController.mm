//
//  YJ_synthesize_test_VCViewController.m
//  YJTest
//
//  Created by zyc on 2017/8/2.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "YJ_synthesize_test_VCViewController.h"

@interface YJ_synthesize_test_VCViewController ()

@end

@implementation YJ_synthesize_test_VCViewController
@synthesize obj1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 虹云试例代码 ARCPlayer alloc] init] 这句会报错 本来猜测是@synthesize引起的
    
    //并不会 refrence 编译报错 猜测是由于 类init 引用其他库，而其他库没有导入进来
    obj1 = [[UIView alloc] init];
    
    
    NSInteger tag = obj1.tag;
    self.obj1 = [[UIView alloc] init];
    
    
    
    
    
    
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
