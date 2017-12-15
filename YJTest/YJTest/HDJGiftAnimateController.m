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
}
@end

@implementation HDJGiftAnimateController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 60, 30)];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(animate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)animate
{
    queue1 = [[NSOperationQueue alloc] init];
    queue1.maxConcurrentOperationCount = 1; // 队列分发
    
    
    GiftModel *giftModel = [[GiftModel alloc] init];
    giftModel.headImage = [UIImage imageNamed:@"flowerTest.jpg"];
    giftModel.giftImage = [UIImage imageNamed:@"RedBean_1"];
    giftModel.name = @"啦啦啦";
    giftModel.giftCount = 100;
    giftModel.giftName = [NSString stringWithFormat:@"赠送了%ld颗红豆", (long)giftModel.giftCount];
    
    AnimOperation *op = [[AnimOperation alloc] init]; // 初始化操作
    op.listView = self.view;
    op.model = giftModel;
    op.block = ^(void){
//        giftAnimPlaying = 0;
//        [self sendGiftTip];
    };
    [queue1 addOperation:op];
}

/*

static int giftAnimPlaying = 0;
- (void)sendGiftTip {
    //没有新消息，返回
    if (giftInfos.count == giftShowFlag) {
        return;
    }//上一条完成，开始下一条
    if (!giftAnimPlaying) {
        [self showGiftAnimation];
        giftShowFlag++;
    }
}

 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
