//
//  ImageTool.h
//  ML_test
//
//  Created by zyc on 2017/11/25.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreML/CoreML.h>

@interface ImageTool : NSObject
+ (UIImage *)imageFromPixelBuffer:(CVPixelBufferRef)pixelBufferRef;

+ (CVPixelBufferRef) pixelBufferFromCGImage: (CGImageRef) image;
@end
