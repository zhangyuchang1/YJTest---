//
//  YJKeychain.h
//  YJTest
//
//  Created by zyc on 16/6/13.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 *Keychain  储存设备号
 */
@interface YJKeychain : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deletekey:(NSString *)service;

@end
