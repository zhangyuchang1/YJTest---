//
//  RuntimeController.m
//  YJTest
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "RuntimeController.h"
#import "Person.h"
#import <objc/message.h>
#import "UIImage+Image.h"
#import "NSObject+Property.h"

@interface RuntimeController ()

@end

@implementation RuntimeController

//******************* 方法调用的本质，就是让对象发送消息 obj_msgSend **************

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    
    Person *p = [[Person alloc] init];
//    [p eat];
    
// ****************** <#(nullable NSDictionary<NSString *,id> *)#>   ******************
    //如果编译不通过， 在build seting里 Apple LLVM 7.1 - Preprocessing -> Enable Strict Checking of objc_msgSend Calls 设成 NO
    
    objc_msgSend(p, @selector(eat));
    //动态添加方法,可以不声明
    [p performSelector:@selector(eat)];
    
    
//    [Person eat];
    
//    [[Person class] eat];
//    
//    objc_msgSend([Person class],@selector(eat));
    
    
//********** 系统自带的方法功能不够，给自带的方法拓展一些功能，并保持原有的功能 *********
    
    //需求：给imageNamed 方法提供功能，每次加载图片判断图片是否加载成功
    
    UIImage *image = [UIImage imageNamed:@"999"];
    

    
    /*1.发送消息
      2.交换方法
      3.动态调用方法
      4.给分类添加属性
    */
    
    NSObject *obj = [[NSObject alloc] init];
    obj.name = @"呵呵呵";
    NSLog(@"%@",obj.name);
    
    
    /* 5.字典转模型 */
    
    
    //test 描边
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(180, 200, 20, 20)];
    view.backgroundColor = [UIColor redColor];
    
    view.layer.cornerRadius = 10;
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    view.layer.borderWidth = 3;
    view.layer.shadowColor = [UIColor whiteColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(1, 1);
//    view.layer.masksToBounds = YES;
    
    view.clipsToBounds = YES;
    [self.view addSubview:view];
    
     
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
