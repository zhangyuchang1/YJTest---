//
//  YJTableHeightTestController.h
//  YJTest
//
//  Created by zyc_hdj on 2018/4/23.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 测试下 cell总高度<table高度时 table的高度会不会只显示成cell的高度
@interface YJTableHeightTestController : UIViewController

// 经测试，并不会table高度变小

//   header高度不对      _tableView.tableHeaderView = self.headerView; 之后再设一下

@end