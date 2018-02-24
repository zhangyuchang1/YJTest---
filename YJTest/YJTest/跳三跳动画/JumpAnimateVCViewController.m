//
//  JumpAnimateVCViewController.m
//  YJTest
//
//  Created by zyc on 2018/1/18.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "JumpAnimateVCViewController.h"
//#import "YXEasing.h"

@interface JumpAnimateVCViewController ()
{
    UIView *view;
}
@property(nonatomic, strong)UIImageView *imageView;


@end

@implementation JumpAnimateVCViewController

-(void)test1
{
    
    
    UIImage *iamge = [UIImage imageNamed:@"yj_test_img.png"];
    
    
    
    CGSize size = iamge.size;
    
    NSLog(@"the size is %@", NSStringFromCGSize(size));
    
    
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    
    
    _imageView.image = [UIImage imageNamed:@"yj_test_img.png"];
    
    
    
    [self.view addSubview:_imageView];
    
    
    
    UITapGestureRecognizer *tapRecognizerRadar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureRadar:)];
    
    [_imageView addGestureRecognizer:tapRecognizerRadar];
    
    _imageView.userInteractionEnabled = YES;
    
    
    
    CGAffineTransform fromTransform = CGAffineTransformScale(_imageView.transform, 0.2, 0.2);
    
    [_imageView setTransform:fromTransform];
    
    //    CGAffineTransform toTransform = CGAffineTransformConcat(_imageView.transform,  CGAffineTransformInvert(_imageView.transform));
    
    //    CGAffineTransform toTransform2 = CGAffineTransformScale(toTransform, 1.3, 1.3);
    
    
    
    [UIView animateWithDuration:1.0 // 动画时长
     
                          delay:0.0 // 动画延迟
     
         usingSpringWithDamping:0.4 // 类似弹簧振动效果 0~1
     
          initialSpringVelocity:5.0 // 初始速度
     
                        options:UIViewAnimationOptionCurveEaseInOut // 动画过渡效果
     
                     animations:^{
                         
                         // code...
                         
                         //                         CGPoint point = _imageView.center;
                         
                         //                         point.y += 150;
                         
                         //                         [_imageView setCenter:point];
                         
                         [_imageView setTransform:fromTransform];
                         
                         _imageView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                         
                         
                         
                     } completion:^(BOOL finished) {
                         
                         // 动画完成后执行
                         
                         // code...
                         
                         [_imageView setAlpha:1];
                         
                     }];

    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test3];
    
    
}
#pragma mark - 动画

-(void)up_1
{
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)test3
{
    view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [view addGestureRecognizer:tap];
    
}
-(void)tap
{
    /*
     
     常规动画属性设置（可以同时选择多个进行设置）
     
     UIViewAnimationOptionLayoutSubviews：动画过程中保证子视图跟随运动。
     
     UIViewAnimationOptionAllowUserInteraction：动画过程中允许用户交互。
     
     UIViewAnimationOptionBeginFromCurrentState：所有视图从当前状态开始运行。
     
     UIViewAnimationOptionRepeat：重复运行动画。
     
     UIViewAnimationOptionAutoreverse ：动画运行到结束点后仍然以动画方式回到初始点。
     
     UIViewAnimationOptionOverrideInheritedDuration：忽略嵌套动画时间设置。
     
     UIViewAnimationOptionOverrideInheritedCurve：忽略嵌套动画速度设置。
     
     UIViewAnimationOptionAllowAnimatedContent：动画过程中重绘视图（注意仅仅适用于转场动画）。
     
     UIViewAnimationOptionShowHideTransitionViews：视图切换时直接隐藏旧视图、显示新视图，而不是将旧视图从父视图移除（仅仅适用于转场动画）
     UIViewAnimationOptionOverrideInheritedOptions ：不继承父动画设置或动画类型。
     
     2.动画速度控制（可从其中选择一个设置）
     
     UIViewAnimationOptionCurveEaseInOut：动画先缓慢，然后逐渐加速。
     
     UIViewAnimationOptionCurveEaseIn ：动画逐渐变慢。
     
     UIViewAnimationOptionCurveEaseOut：动画逐渐加速。
     
     UIViewAnimationOptionCurveLinear ：动画匀速执行，默认值。
     
     3.转场类型（仅适用于转场动画设置，可以从中选择一个进行设置，基本动画、关键帧动画不需要设置）
     
     UIViewAnimationOptionTransitionNone：没有转场动画效果。
     
     UIViewAnimationOptionTransitionFlipFromLeft ：从左侧翻转效果。
     
     UIViewAnimationOptionTransitionFlipFromRight：从右侧翻转效果。
     
     UIViewAnimationOptionTransitionCurlUp：向后翻页的动画过渡效果。
     
     UIViewAnimationOptionTransitionCurlDown ：向前翻页的动画过渡效果。
     
     UIViewAnimationOptionTransitionCrossDissolve：旧视图溶解消失显示下一个新视图的效果。
     
     UIViewAnimationOptionTransitionFlipFromTop ：从上方翻转效果。
     
     UIViewAnimationOptionTransitionFlipFromBottom：从底部翻转效果。
     
     */
    
    // 格式
//    CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)
    // 样例
    /*
    usingSpringWithDamping：弹簧动画的阻尼值，也就是相当于摩擦力的大小，该属性的值从0.0到1.0之间，越靠近0，阻尼越小，弹动的幅度越大，反之阻尼越大，弹动的幅度越小，如果大道一定程度，会出现弹不动的情况。
    initialSpringVelocity：弹簧动画的速率，或者说是动力。值越小弹簧的动力越小，弹簧拉伸的幅度越小，反之动力越大，弹簧拉伸的幅度越大。这里需要注意的是，如果设置为0，表示忽略该属性，由动画持续时间和阻尼计算动画的效果。
     */
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
    } completion:^(BOOL finished) {
    
    }];
    
    [UIView animateWithDuration:1 delay:0.5 usingSpringWithDamping:0.05 initialSpringVelocity:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        view.transform = CGAffineTransformMakeTranslation(1, 1);

    } completion:^(BOOL finished) {
        
    }];
    
//    UIView.animateWithDuration(1, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .AllowUserInteraction, animations: {
//        self.loginButton.center.y -= 30
//        self.loginButton.alpha = 1
//    }, completion: nil)
//

}
- (void)test2
{
     //设置原始画面
         UIView *showView               = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
         showView.layer.masksToBounds   = YES;
         showView.layer.cornerRadius    = 50.f;
         showView.layer.backgroundColor = [UIColor redColor].CGColor;
    
         [self.view addSubview:showView];
    
         //创建关键帧动画
         CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    
         //设置动画属性
         keyFrameAnimation.keyPath              = @"position";
         keyFrameAnimation.duration             = 4.0f;
    
        CGPoint center =   CGPointMake(showView.left + showView.width/2.0, showView.top + showView.height/2.0);
    　　　　//关键处, 在这里使用的缓动函数计算点路径
//         keyFrameAnimation.values = [YXEasing calculateFrameFromPoint:center
//                                                              toPoint:CGPointMake(50, 300)
//                                                                 func:BounceEaseOut
//                                                           frameCount:4.0f * 30];
    
         //设置动画结束位置
         showView.center = CGPointMake(50, 300);
    
         //添加动画到layer层
         [showView.layer addAnimation:keyFrameAnimation forKey:nil];
    
}
- (void)handleTapGestureRadar:(UITapGestureRecognizer *)sender {
    
    [UIView animateWithDuration:0.35 animations:^{
        
        //        _imageView.frame = self.view.bounds;
        
        _imageView.transform = CGAffineTransformMakeScale(20.0f, 20.0f);
        
        _imageView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    
}


@end
