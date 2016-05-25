//
//  Person.m
//  YJTest
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

//+ (void)eat
//{
//    NSLog(@" 类 eat");
//}
//-(void)eat
//{
//    NSLog(@" 对象 eat");
//
//}

void eat (id self,SEL sel){
    NSLog(@"%@ %@--",self,NSStringFromSelector(sel));
}

//当一个对象调用未实现的方法，会调用这个方法，并且会把对应的方法列表传过来
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if(sel == @selector(eat)){
        
        //动态添加eat 方法
        
        class_addMethod(self, @selector(eat), eat, "v@:");
    }
    
    
    return [super resolveInstanceMethod:sel];
}
@end
