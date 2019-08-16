//
//  YJRandView2Controller.m
//  YJTest
//
//  Created by zyc_hdj on 2019/8/16.
//  Copyright © 2019 zyc. All rights reserved.
//

#import "YJRandView2Controller.h"
#import "YJRandItem.h"

@interface YJRandView2Controller ()
{
    // 扔一回中，第几次的索引
    int  index;
}
/// 总共扔了多少次色子，扔一次色子即调用一次rand（）函数
@property (nonatomic,assign) int totalTimes;
/// 一回扔多少次
@property (nonatomic,assign) int onceTimes;
@property (weak, nonatomic) IBOutlet UIButton *onceTimesBtn;
@property (weak, nonatomic) IBOutlet UILabel *numbersLabel;


/// 几个随机数
@property (nonatomic,assign) int numbers;

/// 水平线
@property (weak, nonatomic) IBOutlet UIView *line;

/// 柱子们
@property (strong, nonatomic) NSMutableArray <YJRandItem*>* items;


@end

@implementation YJRandView2Controller


-(NSMutableArray<YJRandItem *> *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.onceTimes = 50;
    self.numbers   = 2;
    
    [self.onceTimesBtn setTitle:[NSString stringWithFormat:@"扔%d次",self.onceTimes] forState:UIControlStateNormal];
}

/// 扔n回
- (IBAction)dropTimes:(UIButton *)sender {
    
    if (self.items.count == 0) {
        CGFloat w = [YJRandItem width];
        CGFloat h = [YJRandItem height];
        CGFloat space = [YJRandItem space];
        CGFloat top = self.line.top - h;
        CGFloat left = 50;
        
        
        int i = 0;
        while (i < self.numbers) {
            
            YJRandItem *item = [[YJRandItem alloc] initWithFrame:CGRectMake(left, top, w, h)];
            item.number = i;
            [self.view addSubview:item];
            [self.items addObject:item];
            item.tag = i+100;
            left += (w + space);
            i ++;
        }
    }
    
    [self beginDrop];
}

// 开始扔色子
-(void)beginDrop
{
    index = 0;
    //    __weak typeof(self) weakSelf = self;
    [self dropOnce];
}

//  每个数字 扔一次色子
-(void)dropOnce
{
    
    for (YJRandItem *item in self.items) {
        
        int add = arc4random() % 2;  // 0|1 随机是否加次数
        // random 貌似偏差大一点
        //    int number = random() % (self.numbers);
        item.times += add;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        item.times ++;
        index ++;
        
        if (index < self.onceTimes) {
            //            blcok();
            [self dropOnce]; //继续扔
        }
        
    });
}

/// 加个随机数， 次数并且清零
- (IBAction)plus:(UIButton *)sender {
    
    for (YJRandItem *item  in self.items) {
        [item removeFromSuperview];
    }
    [self.items removeAllObjects];
    self.numbers ++;
    
    self.numbersLabel.text = [NSString stringWithFormat:@"%d个随机数",self.numbers];
}


@end
