//
//  VCExchangeViewController.m
//  YJTest
//
//  Created by zyc on 16/2/29.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "VCExchangeViewController.h"
#import "VCEchange_A.h"

@interface VCExchangeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain) NSArray *dataArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation VCExchangeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.dataArray = @[@"push 动画"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifer = @"CityAboutCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [self customPush];
}
/// push 自定义动画
-(void)customPush
{
    VCEchange_A *a_VC = [[VCEchange_A alloc] init];
    
//    [self.navigationController pushViewController:a_VC animated:YES];
    
    
    /*
     pageCurl            向上翻一页
     pageUnCurl          向下翻一页
     rippleEffect        滴水效果
     suckEffect          收缩效果，如一块布被抽走
     cube                立方体效果
     oglFlip             上下翻转效果
     */
    
    /*

     以下是基本的四种效果
     kCATransitionPush 推入效果
     kCATransitionMoveIn 移入效果
     kCATransitionReveal 截开效果
     kCATransitionFade 渐入渐出效果
     
     以下API效果可以安全使用
     cube 方块
     suckEffect 三角
     rippleEffect 水波抖动
     pageCurl 上翻页
     pageUnCurl 下翻页
     oglFlip 上下翻转
     cameraIrisHollowOpen 镜头快门开
     cameraIrisHollowClose 镜头快门开
     
     以下API效果请慎用
     spewEffect 新版面在屏幕下方中间位置被释放出来覆盖旧版面.
     genieEffect 旧版面在屏幕左下方或右下方被吸走, 显示出下面的新版面
     unGenieEffect 新版面在屏幕左下方或右下方被释放出来覆盖旧版面.
     twist 版面以水平方向像龙卷风式转出来.
     tubey 版面垂直附有弹性的转出来.
     swirl 旧版面360度旋转并淡出, 显示出新版面.
     charminUltra 旧版面淡出并显示新版面.
     zoomyIn 新版面由小放大走到前面, 旧版面放大由前面消失.
     zoomyOut 新版面屏幕外面缩放出现, 旧版面缩小消失.
     oglApplicationSuspend 像按”home” 按钮的效果.
     */
    
    CATransition *transition = [CATransition animation];
    transition.duration = 1;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"rippleEffect";
    transition.subtype = kCATransitionFromTop;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
//    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:a_VC animated:NO];
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
