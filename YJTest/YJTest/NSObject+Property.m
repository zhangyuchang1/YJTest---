//
//  NSObject+Property.m
//  YJTest
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>
//static NSString *key = @"name";

static const char *key = "name";

@implementation NSObject (Property)

- (NSString *)name
{
    //根据关联的key，获取关联的值
    return objc_getAssociatedObject(self, key);
    
}

- (void)setName:(NSString *)name
{
    
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
