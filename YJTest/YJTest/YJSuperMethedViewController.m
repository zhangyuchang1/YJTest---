//
//  YJSuperMethedViewController.m
//  YJTest
//
//  Created by zyc on 2020/7/9.
//  Copyright © 2020 zyc. All rights reserved.
//

#import "YJSuperMethedViewController.h"

@interface YJSuperMethedViewController ()

@end

@implementation YJSuperMethedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //  红豆角 baseApi里有个循环调用，
    
    // 在子类方法里调用
    // [super performSelector:@selector(analyseDataWithDebug)];  这样好像会递归
//    [super analyseDataWithDebug];
    
    
//    // 支持假数据调试
//    -(void)analyseDataWithDebug
//    {
//        // [super performSelector:@selector(analyseDataWithDebug)];  这样好像会递归
//        [super analyseDataWithDebug];
//
//        if (self.isSuccess) {
//
//            PageInfo *pageInfo = [self requestReplyPage];
//            if (pageInfo.pages <= pageInfo.pageIndex) {
//                _isMore = NO;
//            }else{
//                _isMore = YES;
//            }
//        }
//
//    }

    
    
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
