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
#import <objc/runtime.h>
#import <malloc/malloc.h>
//#import "UIImage+Image.h"
//#import "NSObject+Property.h"
//
#import "UIView+CornerBorder.h"

@interface RuntimeController ()

@end

@implementation RuntimeController


/*
 添加属性
 static char strAddrKey = 'a';
 - (NSString *)addr
 {
 return objc_getAssociatedObject(self, &strAddrKey);
 }
 - (void)setAddr:(NSString *)addr
 {
 objc_setAssociatedObject(self, &strAddrKey, addr, OBJC_ASSOCIATION_COPY_NONATOMIC);
 }
 
 */

//******************* 方法调用的本质，就是让对象发送消息 obj_msgSend **************

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getObjSize];
    // Do any additional setup after loading the view.
    
    Person *p = [[Person alloc] init];
//    [p eat];
    
// ****************** <#(nullable NSDictionary<NSString *,id> *)#>   ******************
    //如果编译不通过， 在build seting里 Apple LLVM 7.1 - Preprocessing -> Enable Strict Checking of objc_msgSend Calls 设成 NO
//    
//    objc_msgSend(p, @selector(eat));
//    //动态添加方法,可以不声明
//    [p performSelector:@selector(eat)];
    
    
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
//    obj.name = @"呵呵呵";
//    NSLog(@"%@",obj.name);
    
    
    /* 5.字典转模型 */
    
    
    //test 描边
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(140, 200, 80, 80)];
//    view.backgroundColor = [UIColor redColor];
//    
//    view.layer.cornerRadius = 10;
////    view.layer.backgroundColor = [UIColor yellowColor].CGColor;
//    view.layer.borderColor = [UIColor whiteColor].CGColor;
//    view.layer.borderWidth = 3;
////    view.layer.shadowColor = [UIColor whiteColor].CGColor;
////    view.layer.shadowOffset = CGSizeMake(1, 1);
////    view.layer.masksToBounds = YES;
//    
//    view.clipsToBounds = YES;
    [self.view addSubview:view];
    
    
    
    UIImage *iamge2 = [UIView imageWithSize:CGSizeMake(80, 80) radius:60 borderColor:[UIColor redColor] borderWidth:10.0 backgroundColor:[UIColor yellowColor]];
    
    view.backgroundColor = [UIColor colorWithPatternImage:iamge2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 测一下对象占内存的大小
- (void)getObjSize
{
    
    NSObject *obj = [[NSObject alloc] init];
    
    size_t objSize = class_getInstanceSize([obj class]);
    size_t vcSize = class_getInstanceSize([self class]);
    
    NSLog(@"NSObject 的内存大小占用 %lu",objSize);
    NSLog(@"RuntimeController 的内存大小占用 %lu",vcSize);

    
//    //获得NSObject 类的实例对象的大小  ，
   NSLog(@"%zd",class_getInstanceSize([NSObject class])  );
         //获取obj对象指针获取的大小， 实际系统分配的大小
   NSLog(@"%zd",malloc_size((__bridge const void *)obj));
    
    
    /*
    NSObject 对象包含一个 void * 类型的 isa,随意 NSObject 对象占用 8 个字节的内存.

    由于系统是以 16 字节为单位来分配内存的,小于 16 字节就分配 16 字节,大于 16 字节就会分配 16 字节的整数倍大小,所以 NSObject 最后会占用 16 字节的内存大小

    作者：堕落白天使
    链接：https://www.jianshu.com/p/602e05573405
    来源：简书
    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
    */
    
}

// 底层都会转成C 和 C++的代码
- (void)C
{
//    NSObject *obj = [[NSObject alloc] init];
    

    NSObject *obj = (
                     (NSObject *(*)(id, SEL)
                      )
                     (void *)objc_msgSend)(
                                           (id)((NSObject *(*)(id, SEL))
                                                (void *)objc_msgSend)(
                                                        (id)objc_getClass("NSObject"),
                                                        sel_registerName("alloc")),
                                                        sel_registerName("init")
                                           );

    
}

@end
