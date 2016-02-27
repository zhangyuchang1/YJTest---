//
//  AppleMapViewController.h
//  YJTest
//
//  Created by zyc on 16/2/27.
//  Copyright © 2016年 zyc. All rights reserved.
//

//地图app 需要在info.plist 中添上 NSLocationAlwaysUsageDescription

#import <UIKit/UIKit.h>
@class MKMapView;

@interface AppleMapViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *long_textField;
@property (weak, nonatomic) IBOutlet UITextField *lat_textFeild;

@property (weak, nonatomic) IBOutlet UIButton *serchButton;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@property (weak, nonatomic) IBOutlet UIView *toolBarView;

- (IBAction)search:(UIButton *)sender;

@end
