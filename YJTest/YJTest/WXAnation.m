//
//  ViewController.m
//  TestMap
//
//  Created by zyc on 15/4/1.
//  Copyright (c) 2015年 zyc. All rights reserved.
//


#import "WXAnation.h"

@implementation WXAnation

- (id)initWithCLLocationCoordinate2D:(CLLocationCoordinate2D) coordinate
{
    self = [super init];
    if (self != nil) {
        
        _coordinate = coordinate;
    }
    
    return self;
    
}

@end
