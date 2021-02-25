//
//  YJTestRemoveView.m
//  YJTest
//
//  Created by zyc on 2019/11/18.
//  Copyright © 2019 zyc. All rights reserved.
//

#import "YJTestRemoveView.h"

@implementation YJTestRemoveView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addBtn];
    }
    return self;
}

- (void) addBtn
{
    UIButton *b = [[UIButton alloc] initWithFrame:self.bounds];
    b.backgroundColor = [UIColor redColor];
    [b addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:b];
    
}

- (void)remove
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    
    
    
    
    
//    [self removeFromSuperview];
}
-(void)dealloc
{
    NSLog(@"");
    
}

@end
