//
//  SearchResultController.h
//  YJTest
//
//  Created by zyc on 16/7/13.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultController : UIViewController<UISearchResultsUpdating>

@property (copy, nonatomic) void (^searchResultTap)();

@end
