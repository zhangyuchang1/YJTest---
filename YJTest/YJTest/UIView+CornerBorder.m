//
//  UIView+CornerBorder.m
//  YJTest
//
//  Created by mac on 16/9/22.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "UIView+CornerBorder.h"
#import <objc/runtime.h>

@implementation UIView (CornerBorder)

//static char strAddrKey = 'a';
//- (NSString *)addr
//{
//    return objc_getAssociatedObject(self, &strAddrKey);
//}
//- (void)setAddr:(NSString *)addr
//{
//    objc_setAssociatedObject(self, &strAddrKey, addr, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}

+ (UIImage*)imageWithColor:(UIColor*)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f,0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, [UIScreen mainScreen].scale);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithSize:(CGSize)size radius:(CGFloat)radius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor
{
    if (!backgroundColor){
        backgroundColor = [UIColor whiteColor];
    }
  
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    
    CGFloat halfBorderWidth = borderWidth / 2;
    //设置上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //边框大小
    CGContextSetLineWidth(context, borderWidth);
    //边框颜色
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    //矩形填充颜色
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGFloat height = size.height;
    CGFloat width = size.width;
    
    CGFloat startPointY;
    if (radius >= height - borderWidth) {
        startPointY = height;
    } else if (radius > 0){
        startPointY = halfBorderWidth + radius;
    } else {
        startPointY = 0;
    }
//
    
//    CGContextAddArc(CGContextRef cg_nullable c, CGFloat x, CGFloat y,
//                    CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
//    
//    CGContextAddArc(context, 0, 30, 30, 0, 2*M_PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathFillStroke);//绘制填充
    
    
    
    CGContextMoveToPoint(context, width - halfBorderWidth, startPointY);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width / 2, height - halfBorderWidth, radius);  // 右下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height / 2, radius); // 左下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, width / 2, halfBorderWidth, radius); // 左上角
    CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, height / 2, radius); // 右上角
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outImage;
    
    
}
@end
