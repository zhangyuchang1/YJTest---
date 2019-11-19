//
//  YJModel.m
//  YJTest
//
//  Created by zyc on 2019/11/14.
//  Copyright © 2019 zyc. All rights reserved.
//

#import "YJModel.h"

// 列表中的对象
@implementation YJModelItem

@end

@implementation YJModelSub

@end

@implementation YJModel


+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"items":@"YJModelItem",// 或者
//             @"items":[YJModelItem class],
             };
}

//+ (NSDictionary *)mj_replacedKeyFromPropertyName
//{
//    return @{
//             // 模型属性: JSON key, MJExtension 会自动将 JSON 的 key 替换为你模型中需要的属性
//             @"id_":@"id",
//             };
//
//}



@end
