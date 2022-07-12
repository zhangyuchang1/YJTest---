//
//  BObject.m
//  YJTest
//
//  Created by zyc on 2022/7/12.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "BObject.h"

@implementation BObject

-(void)doLog
{
    // 在父类方法基础上，再加额外处理
    [super doLog];
    
    //  经测试，父类用 performSelector会递归
//    [super performSelector:@selector(doLog)];

    
    //额外处理
    NSLog(@"  b  do  log");
    
}

@end
