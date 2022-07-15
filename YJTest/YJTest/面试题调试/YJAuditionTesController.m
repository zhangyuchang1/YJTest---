//
//  YJAuditionTesController.m
//  YJTest
//
//  Created by zyc on 2022/7/14.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "YJAuditionTesController.h"
#import "Sark.h"
#import <objc/message.h>

@interface YJAuditionTesController ()

@end

@implementation YJAuditionTesController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    // --------------------------
    
    [self test2];
    
    
    
    

    NSLog(@" end -----");

    
}

- (void)test1{
    
    
    // vid是一个指针，用于表示OC 任意类型实例对象的指针，默认告诉编译器该指针指向的对象可以调用任何方法，
    id cls = [Sark class];
    
    // void *表示“任意类型的指针”
    void *obj = &cls;
    
//    ((void (*)(id, SEL))(void *)objc_msgSend)((id)cls, sel_registerName("sayHello"));

    [(__bridge id)obj speak];
    
    
    // 会打印出来：
    // my name is <YJAuditionTesController: 0x7ff4a00093d0>
    
}

- (void)test2
{
    NSLog(@"viewController = %@, 地址 = %p--%p", self, self,&self);
    
    id cls = [Sark class];
    NSLog(@"Sark class = %@, 地址 = %p",cls, &cls);
    
    void *obj = &cls;
    NSLog(@"Void *obj = %@ 地址 = %p", obj, &obj);
    [(__bridge id)obj speak];
    
    
    Sark *sark = [[Sark alloc] init];
    NSLog(@"Sark instance = %@ 地址 = %p", sark, &sark);
    [sark speak];
    

}

- (void)allocAddress
{
    // 内存分配
    Sark * p1 = [Sark alloc];
    Sark * p2 = [p1 init];
    Sark * p3 = [p1 init];
    NSLog(@"%@ - %p - %p",p1,p1,&p1);
    NSLog(@"%@ - %p - %p",p2,p2,&p2);
    NSLog(@"%@ - %p - %p",p3,p3,&p3);

    // 结论：地址空间的创建来自于alloc， %p内存地址一样     ，&p指针地址不一样
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
