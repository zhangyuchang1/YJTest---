//
//  HDJWKWebConfiguration.h
//  Vlink
//
//  Created by zyc on 2017/9/25.
//  Copyright © 2017年 myTV. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface HDJWKWebConfiguration : WKWebViewConfiguration
/// JS事件回调
@property (nonatomic, copy) void(^handleBlock)(NSDictionary *responseDic);
@end
