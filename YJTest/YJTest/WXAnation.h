//
//  ViewController.m
//  TestMap
//
//  Created by zyc on 15/4/1.
//  Copyright (c) 2015年 zyc. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface WXAnation : NSObject<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


- (id)initWithCLLocationCoordinate2D:(CLLocationCoordinate2D) coordinate;

@end
