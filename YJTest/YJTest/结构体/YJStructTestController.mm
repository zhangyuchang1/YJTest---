//
//  YJStructTestController.m
//  YJTest
//
//  Created by zyc on 2022/7/26.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "YJStructTestController.h"

// 结构体的定义方法

typedef struct {
    int age;
    NSString *name;
} PersonStruct;

struct objc_person {
    int age;
    NSString *name;
};

struct objc_people : objc_person { // 结构体的继承 ，C++ 语法 几乎等于OC的类
    int sex;
};

//typedef struct PersonStruct Pe;

typedef struct objc_person *PerS;

typedef struct objc_people PersO;

// 其实OC类本质上也是一个结构体

@interface YJStructTestController ()


@property (nonatomic,assign) PersonStruct p1;
@property (nonatomic,assign) PersonStruct *p2;
@property (nonatomic,assign) PersO p3;
@property (nonatomic,assign) PersO *p4;
@property (nonatomic,assign) PerS p5;
@property (nonatomic,assign) PerS *p6;


@end

@implementation YJStructTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 最好用 第一种定义方法
    
    _p1 = {2,@"老王"};
    _p2->age = 3;
//    _p2 = *_p1;
   
    _p3.age = 3;
    _p3.name = @"小王";

    _p4->age = 5;
    _p4->name = @"老好";
    
    _p5->age = 7;
    
//    _p6.age = 8;
    
    NSLog(@"");
    
}



@end
