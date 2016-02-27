//
//  YJTestViewController.h
//  YJTest
//
//  Created by zyc on 16/1/26.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
//  经测试，push到一个VC，并把这个VC的lastController 设成self， 并不会造成循环引用， 可以释放
@interface YJTestViewController : UIViewController
@property (nonatomic,retain) UIViewController *lastViewController;
@end
