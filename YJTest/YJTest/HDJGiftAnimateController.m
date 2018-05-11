//
//  HDJGiftAnimateController.m
//  YJTest
//
//  Created by zyc on 2017/12/15.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "HDJGiftAnimateController.h"
#import "AnimOperation.h"

@interface HDJGiftAnimateController ()
{
    NSOperationQueue *queue1; // 全局动画队列1
    
    NSInteger giftShowFlag;

}
@end

@implementation HDJGiftAnimateController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 74, 60, 30)];
    btn.backgroundColor = [UIColor greenColor];
    btn.tag = 1;
    [btn addTarget:self action:@selector(showGiftAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 174, 60, 30)];
    btn2.backgroundColor = [UIColor greenColor];
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(showGiftAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(50, 274, 60, 30)];
    btn3.backgroundColor = [UIColor greenColor];
    btn3.tag = 3;
    [btn3 addTarget:self action:@selector(showGiftAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showGiftAnimation:(UIButton *)btn
{
    queue1 = [[NSOperationQueue alloc] init];
    queue1.maxConcurrentOperationCount = 1; // 队列分发
    
    
    GiftModel *giftModel = [[GiftModel alloc] init];
    giftModel.headImage = [UIImage imageNamed:@"flowerTest.jpg"];
    giftModel.giftImage = [UIImage imageNamed:@"RedBean_1"];
    giftModel.name = @"啦啦啦";
    
    
    
    giftModel.giftCount = 520;
    
    
    
    giftModel.giftName = [NSString stringWithFormat:@"赠送了%ld颗红豆", (long)giftModel.giftCount];
    
    AnimOperation *op = [[AnimOperation alloc] init]; // 初始化操作
    
    op.animateTye = btn.tag;
    
    op.listView = self.view;
    op.model = giftModel;
    op.block = ^(void){
        giftAnimPlaying = 0;
        [self sendGiftTip];
    };
    [queue1 addOperation:op];
}


static int giftAnimPlaying = 0;
- (void)sendGiftTip {

    //上一条完成，开始下一条
    if (!giftAnimPlaying) {
//        [self showGiftAnimation:nil];
        giftShowFlag++;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
