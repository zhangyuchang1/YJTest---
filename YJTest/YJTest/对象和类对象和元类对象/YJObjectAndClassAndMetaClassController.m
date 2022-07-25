//
//  YJObjectAndClassAndMetaClassController.m
//  YJTest
//
//  Created by zyc on 2022/7/25.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "YJObjectAndClassAndMetaClassController.h"
#import "MJPerson.h"
#import <objc/runtime.h>

@interface YJObjectAndClassAndMetaClassController ()

@end

@implementation YJObjectAndClassAndMetaClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test];
    
}

- (void)test
{
    
    /* ---- 实例对象 内存中存放 ---
        1. isa指针（指向类对象）
        2. 其他成员变量 的值
     
        因为内存中是以isa开始的，isa的内存地址即是对象的内存地址
     
      ---- 类对象 （class） 内存中存放 ---
         1. isa指针（指向元类对象）
         2. superclass指针 (指向父类的类对象，NSObject的指向为nil)
         3. 类的属性信息（@prperty）、类的对象方法信息 （instance method  eg.-（void）..）
         4. 类的协议信息（protocal）、类的成员变量信息（ivar 类型 名称）
     
     
     ---- 元类对象 （meta class） 内存中存放 ---
         1. isa 指针  （指向最基类的元类 ）
         2. superclass指针 (指向父类的元类对象，NSobject的指向基类的类对象)
         3. 类的类方法信息 （ class method eg. + (void)..）

     
    */
    
    // 实例对象    instance对象
    MJPerson *p1 = [[MJPerson alloc] init];
    MJPerson *p2 = [[MJPerson alloc] init];
    
    // 类对象， 内存中只保留一份  class对象
    Class pClass1 = [p1 class];
    Class pClass2 = [p2 class];
    Class pClass3 = object_getClass(p1); // 参数是对象
    Class pClass4 = [MJPerson class];


    
    // 元类对象   meta-Class 对象
    Class metaClass1 = object_getClass(pClass1);  // 参数是类对象
    Class metaClass2 = object_getClass(object_getClass(p1));
    
    // 指向最基类的元类  都会指向NSObject
    Class metaClass3 = object_getClass(object_getClass(object_getClass(p1)));
    Class metaClass4 = object_getClass(object_getClass(object_getClass(pClass4)));
 
    
    Class metaClass5 = object_getClass([NSObject class]);
    Class metaClass6 = object_getClass(object_getClass([NSObject class]));

    

    NSLog(@"instance - %p %p",
          p1,
          p2);
    
    NSLog(@"class - %p %p %p %p",
          pClass1,
          pClass2,
          pClass3,
          pClass4);
    
    NSLog(@"metaClass - %p %p %p %p",
          metaClass1,
          metaClass2,
          metaClass3,
          metaClass4);
    
    NSLog(@"nsobject metaClass - %p %p",
          metaClass5,
          metaClass6);
    
    
    NSLog(@"是否是元类对象 - %d %d %d %d %d %d  %d %d",
          class_isMetaClass(pClass1),
          class_isMetaClass(pClass4),
          class_isMetaClass(metaClass1),
          class_isMetaClass(metaClass2),
          class_isMetaClass(metaClass3),
          class_isMetaClass(metaClass4),
          class_isMetaClass(metaClass5),
          class_isMetaClass(metaClass6)
          );
}

- (void)test2
{
    // 不同类型对象的 isa  指向哪里
    MJPerson *p1 = [[MJPerson alloc] init];
    

}

@end
