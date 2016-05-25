//
//  UIImage+Image.m
//  YJTest
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/runtime.h>

@implementation UIImage (Image)

// 加载到内存的时候调用
+(void)load
{
    //获取方法地址
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    
    Method imageNamed   = class_getClassMethod(self, @selector(imageNamed:));
    
    //交换
    method_exchangeImplementations(imageWithName, imageNamed);
}

+(instancetype)imageWithName:(NSString *)name
{
//这里调imageWithName 相当于imageNamed：
    UIImage *image = [self imageWithName:name];
    
    
    if(image == nil){
        NSLog(@"加载空图片");
    }
    return image;
}
@end
