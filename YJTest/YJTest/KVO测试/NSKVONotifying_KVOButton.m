//
//  NSKVONotifying_KVOButton.m
//  YJTest
//
//  Created by zyc on 2022/7/27.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "NSKVONotifying_KVOButton.h"

@implementation NSKVONotifying_KVOButton


-(void)setValue:(NSInteger)value
{
    _NSSetIntValueAndNotify();
    
    [self willChangeValueForKey:@"value"];
    [super setValue:value];
    [self didChangeValueForKey:@"value"];
    
}

// Fondation里的 C 函数
void _NSSetIntValueAndNotify()
{
    /*   里面实现大概是这样
        [self willChangeValueForKey:@"value"];
        [super setValue:value];
        [self didChangeValueForKey:@"value"];
     */
}

-(void)didChangeValueForKey:(NSString *)key
{
    // 通知监听器，发生了改变
//    [ obersevr observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context];
}


@end


// 在 project build phases中 去掉，不要编译，否则 KVOButton 加 kvo会失效，因为和系统会自动生成
