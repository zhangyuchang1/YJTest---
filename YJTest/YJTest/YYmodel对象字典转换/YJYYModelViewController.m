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
    
    [self func7];

    
}

- (void)func1
{
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
        
}
- (void)func2
{
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
- (void)func3
{
      // ------------- 3. 对象转字典,对象中有list对象  ---------------
    
    // 不需要在类的。m中写指定也能转字典
    YJModel *model = ({
   
        YJModel *model = [[YJModel alloc] init];
    //        model.sting1 = @"sting1";
    
        model.objSub = ({
            YJModelSub *subModel = [[YJModelSub alloc] init];
    ////            subModel.stingSub1 = @"stingSub1";
       
            subModel;
        });
    
        model.items = (@[
                    ({
                    YJModelItem *item = [[YJModelItem alloc] init];
                    item.itemSting1 = @"itemSting1";
                    item;
                    }),
                ]);
    
        model;
    });

    NSDictionary *dic = model.mj_keyValues;
    
    
    
    NSLog(@"");
    
    
}

- (void)func4
{
      // ------------- 3. 字典转对象,字典中有list字典  ---------------
    
     NSDictionary *dicit = @{
             @"objSub":@{
                         @"stingSub1":@"stingSub1",
     //                    @"intSub1":@"2",
                         },
             @"sting1":@"sting1",
             @"int1":@2,
             @"items":@[
                         @{@"itemSting1":@"itemSting1",@"itemint1":@1},
                         @{@"itemSting1":@"itemSting2",@"itemint1":@2},
                       ],
         };
         
     YJModel *yjModel = [YJModel mj_objectWithKeyValues:dicit];
    
    // 必须要在YJModel.m 中实现
    /*
    + (NSDictionary *)mj_objectClassInArray
    {
        return @{
                 @"items":@"YJModelItem",// 或者
                 };
    }
    */
    // 或者调用 好像不行？？？？？？
    /*
    [YJModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
            @"items":@"YJModelItem",// 或者
        };
    }];
    */
     
     NSLog(@"%@",yjModel);
    
    
}
- (void)func5
{
      // ------------- 3. 字典转对象,字典中有id关键字  ---------------
    
    // c必须要在 YJModel.m中写，替换id
    /**
     + (NSDictionary *)mj_replacedKeyFromPropertyName
     {
         return @{
                  @"id_":@"id",
                  };

     }
     
     */
    
    NSDictionary *dicit = @{
               @"objSub":@{
                           @"stingSub1":@"stingSub1",
       //                    @"intSub1":@"2",
                           },
               @"sting1":@"sting1",
               @"int1":@2,
               @"id": @"123",
      
           };
    YJModel *yjModel = [YJModel mj_objectWithKeyValues:dicit];
    NSLog(@"%@",yjModel);

}

- (void)func6
{
      // ------------- 6. 看看model的id_ 转成字典后，能不能自动转成 @"id" ---------------
    
    // 不需要在类的。m中写指定也能转字典
      YJModel *model = ({
     
          YJModel *model = [[YJModel alloc] init];
      //        model.sting1 = @"sting1";
      
          model.objSub = ({
              YJModelSub *subModel = [[YJModelSub alloc] init];
      ////            subModel.stingSub1 = @"stingSub1";
         
              subModel;
          });
          model.id_ = 123;
      
          model;
      });

     
    NSDictionary *dic = model.mj_keyValues;
    NSLog(@"");
    
    // 经测试 ，可以自动转回去
}
- (void)func7
{
      // ------------- 6. 字典转模型 ，@"id"处理能不能写到基类中 ---------------
        
    NSDictionary *dicit = @{
               @"objSub":@{
                           @"stingSub1":@"stingSub1",
       //                    @"intSub1":@"2",
                           },
               @"sting1":@"sting1",
               @"int1":@2,
               @"id": @"123",
      
           };
    YJModel *yjModel = [YJModel mj_objectWithKeyValues:dicit];
    NSLog(@"%@",yjModel);
    
    
    NSDictionary *dic = yjModel.mj_keyValues;

    NSLog(@"%@");


}



@end
