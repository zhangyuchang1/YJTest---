//
//  KVOButton.h
//  YJTest
//
//  Created by zyc on 16/7/7.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVOButton : UIButton
{
    @public
    NSInteger _value;
}
@property (nonatomic,assign) NSInteger value;


@property (nonatomic,assign) UIViewController *vc;


- (void)addKVO;

- (void)removeKVVO;
@end
