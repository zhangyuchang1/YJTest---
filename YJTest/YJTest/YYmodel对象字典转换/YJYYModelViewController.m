//
//  YJYYModelViewController.m
//  YJTest
//
//  Created by zyc on 2019/11/13.
//  Copyright © 2019 zyc. All rights reserved.
//

#import "YJYYModelViewController.h"
#import "YJModel.h"
#import "YYKit.h"
#import "MJExtension.h"

@interface YJYYModelViewController ()

@end

@implementation YJYYModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.\
    
    // ------------- 1. 对象转字典  ---------------
    YJModel *model = ({
        YJModel *model = [[YJModel alloc] init];
//        model.sting1 = @"sting1";
        model.objSub = ({
            YJModelSub *subModel = [[YJModelSub alloc] init];
////            subModel.stingSub1 = @"stingSub1";
            subModel;
        });
        
        model;
    });
    NSDictionary *dic = model.mj_keyValues;
    /*
     看看 int的property，如果没赋值，字典里面有没有这个key？
     如果没有赋值， 有   int = 0；
                  没有 NString，
                  没有 NSNumber，
                  没有 NSObject
                    
     {
         int1 = 0;
         objSub =     {
             intSub1 = 0;
             stingSub1 = stingSub1;
         };
         sting1 = sting1;
     }
     */
    /* 所以 传接口的property ，如果是非必传的字段，不能用int申明，会传0过去  */
    NSLog(@"%@",dic);
    
    //
  
    
    
    // ----------------  2. 字典转对象  ------------
    NSDictionary *dicit = @{
        @"objSub":@{
                    @"stingSub1":@"stingSub1",
//                    @"intSub1":@"2",
                    },
        @"sting1":@"sting1",
        @"int1":@2,
        
        
    };
    
    YJModel *yjModel = [YJModel mj_objectWithKeyValues:dicit];
    NSLog(@"%@",yjModel);
    
    // 由 字典转模型时，声明的int，返的string或者number都没问题，如果没返，就是0；
    
    // 对于返的数字类型，声明 int,sting,number 都可以，但是 要是想区分接口有没有返，就不能用int声明
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
