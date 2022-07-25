//
//  OC_CPP_Person.h
//  YJTest
//
//  Created by zyc on 2022/7/25.
//  Copyright © 2022 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OC_CPP_Person : NSObject

@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END


// OC 转成c/c++ 文件， 终端中执行
// xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc OC_CPP_Person.m -o OC_CPP_Person-arm64.cpp


//   底层实际上是一个这样结构体
/*
struct OC_CPP_Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _age;
    int _sex;
    NSString * _Nonnull _name;
};
*/
