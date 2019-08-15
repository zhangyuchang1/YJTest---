//
//  YJRandViewController.m
//  YJTest
//
//  Created by zyc_hdj on 2019/8/15.
//  Copyright © 2019 zyc. All rights reserved.
//

#import "YJRandViewController.h"
#import "YJRandItem.h"

@interface YJRandViewController ()

/// 总共扔了多少次色子，扔一次色子即调用一次rand（）函数
@property (nonatomic,assign) int totalTimes;
/// 一回扔多少次
@property (nonatomic,assign) int onceTimes;

/// 几个随机数
@property (nonatomic,assign) int numbers;

/// 水平线
@property (weak, nonatomic) IBOutlet UIView *line;

/// 柱子们
@property (strong, nonatomic) NSMutableArray <YJRandItem*>* items;


@end

@implementation YJRandViewController

-(NSMutableArray<YJRandItem *> *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.onceTimes = 100;
    self.numbers   = 2;

}

/// 扔n个次数
- (IBAction)dropTimes:(UIButton *)sender {
    
    if (self.items.count == 0) {
        CGFloat w = [YJRandItem width];
        CGFloat h = [YJRandItem height];
        CGFloat space = [YJRandItem space];
        CGFloat top = self.line.top - h;
        CGFloat left = 50;
        
//        for (int i ; <#condition#>; <#increment#>) {
//            <#statements#>
//        }
        
        int i = 0;
        while (i < self.numbers) {
            
            YJRandItem *item = [[YJRandItem alloc] initWithFrame:CGRectMake(left, top, w, h)];
            [self.view addSubview:item];
            
            
            left += (w + space);
            i ++;
        }
        
        
        
        
    }
    
}

/// 加个随机数， 次数并且清零
- (IBAction)plus:(UIButton *)sender {
    
    
}

@end
