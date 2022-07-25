//
//  OC_CPP_Person.m
//  YJTest
//
//  Created by zyc on 2022/7/25.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "OC_CPP_Person.h"

@interface OC_CPP_Person()
{
    int _age;
}

@property (nonatomic, assign) int sex;

@end

@implementation OC_CPP_Person

+ (void)speak
{
    NSLog(@"I can speak");
}
- (void)sayHello
{
    NSLog(@"hello~");
}

@end
