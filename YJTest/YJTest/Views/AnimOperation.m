//
//  AnimOperation.m
//  presentAnimation
//
//

#import "AnimOperation.h"
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface AnimOperation ()
{
    int flag;
    NSInteger giftLevel;
    BOOL isRain;
}
@property (nonatomic, getter = isFinished)  BOOL finished;
@property (nonatomic, getter = isExecuting) BOOL executing;
@property (nonatomic, strong) NSTimer *timer;
@end


@implementation AnimOperation

@synthesize finished = _finished;
@synthesize executing = _executing;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _executing = NO;
        _finished  = NO;
        flag = 0;
    }
    return self;
}

- (void)start {
    
    if ([self isCancelled]) {
        self.finished = YES;
        return;
    }
    self.executing = YES;
    
    if (self.model.giftCount > 10) {
        isRain = YES;
        //判断赠送级别
        switch (self.model.giftCount) {
            case 50:
                giftLevel = 1;
                break;
            case 100:
                giftLevel = 2;
                break;
            case 520:
                giftLevel = 3;
                break;
            case 666:
                giftLevel = 4;
                break;
            case 1314:
                giftLevel = 5;
                break;
            default:
                break;
        }

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 / giftLevel target:self selector:@selector(redBeansRainAnimation) userInfo:nil repeats:YES];
            [self performSelector:@selector(endTimer) withObject:nil afterDelay:giftLevel + 1.5];
        }];
    }
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        _presentView = [[PresentView alloc] init];
        _presentView.model = _model;
//        _presentView.frame = CGRectMake(-self.listView.frame.size.width / 2, self.listView.frame.size.height / 2 - 20, self.listView.frame.size.width / 2, 40);
        _presentView.frame = CGRectMake(-414 / 2, [UIScreen mainScreen].bounds.size.width / 2 - 20, 414 / 2, 40);
        _presentView.originFrame = _presentView.frame;
        [self.listView addSubview:_presentView];
        [self.presentView animateWithGiftTime:giftLevel + 1.5 CompleteBlock:^(BOOL finished) {
            self.finished = finished;
            if ((self.block)&&(!isRain)) {//flag=0 雨动画不执行或执行结束
                self.block();
            }
        }];
    }];
}

- (void)endTimer {
    flag = 0;
    if ((self.block)&&(isRain)){
        self.block();
    }
    [self.timer invalidate];
}
#define scale(X) X/2.0
- (void)redBeansRainAnimation{
    flag++;
        //直上直下雨
//    for (int i = 0; i<kScreenWidth/36; i++) {
//        UIImageView *redBean = [[UIImageView alloc] init];
//        redBean.frame = CGRectMake(arc4random_uniform(kScreenWidth/36) * 36+ 10, -40, 36, 39);
//        redBean.image = [UIImage imageNamed:[NSString stringWithFormat:@"rain_%d", arc4random_uniform(14)+1]];
//        [self.listView addSubview:redBean];
//        NSTimeInterval time = arc4random_uniform(10)/10.0+1;
//        [UIView animateWithDuration:time animations:^{
//            CGRect frame = redBean.frame;
//            frame.origin.y = kScreenHeight;
//            redBean.frame = frame;
//        } completion:^(BOOL finished) {
//            [redBean removeFromSuperview];
//        }];
//    }
    //瀑布雨
    for (int i = 0; i<kScreenWidth/36; i++) {
        CALayer *redBeanLayer = [[CALayer alloc] init];
        NSString *giftName = [NSString stringWithFormat:@"rain_%d", arc4random_uniform(14)+1];
        UIImage *image = [UIImage imageNamed:giftName];
        redBeanLayer.frame = CGRectMake(arc4random_uniform(kScreenWidth) + 10, -40, image.size.width/1.2, image.size.height/1.2);
        redBeanLayer.contents = (__bridge id)(image.CGImage);
        [self.listView.layer addSublayer:redBeanLayer];
        //设置弧形轨迹
        UIBezierPath *movePath = [UIBezierPath bezierPath];
        [movePath moveToPoint:redBeanLayer.position];
        CGPoint toPoint = CGPointMake((redBeanLayer.position.x + kScreenWidth) / 3.0,kScreenWidth);
        CGPoint controlPoint1 = CGPointMake(arc4random_uniform(kScreenWidth / 2) + kScreenWidth / 4.0, kScreenHeight / 2.0);
        CGPoint controlPoint2 = CGPointMake(arc4random_uniform(kScreenWidth / 3) + kScreenWidth / 3.0, kScreenHeight);
        [movePath addCurveToPoint:toPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
        CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        moveAnim.path = movePath.CGPath;
        moveAnim.duration = arc4random_uniform(10)/10.0+1.5 * (kScreenHeight / 736.0);
        moveAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        //开始动画
        [redBeanLayer addAnimation:moveAnim forKey:@"animation"];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObject:redBeanLayer forKey:@"layer"];
        
        [NSTimer scheduledTimerWithTimeInterval:moveAnim.duration target:self selector:@selector(clearLayer:) userInfo:dic repeats:NO];
    }

    //流星雨
    /*
    CGFloat totalH = kScreenHeight + kScreenWidth /106.0 *76;
    CGFloat cellH = totalH / (giftLevel + 4);
//    for (int i = 0; i < kScreenHeight / kScreenWidth * 3 + 1; i++)
    for (int i = -4; i < totalH / cellH + 1; i++) {
        UIImageView *redBean = [[UIImageView alloc] init];
        UIImage *redBeanRain = [[UIImage alloc] init];
        NSTimeInterval time;
        if (!((i^flag) %2))
        {
            float random = (arc4random_uniform(5)+5)/10.0;
//            NSString *giftName = [NSString stringWithFormat:@"rain_%d", arc4random_uniform(14)+1];
            redBeanRain = [UIImage imageNamed:@"RedBean_1"];
            redBean.frame = CGRectMake(kScreenWidth, cellH * i, redBeanRain.size.width * random, redBeanRain.size.height * random);
//            redBean.frame = CGRectMake(kScreenWidth, (kScreenWidth / 4) / 106.0 * 76 * i, 36 * 1.5, 39 * 1.5);
            time = arc4random_uniform(10)/10.0+0.6;
        }else{
            redBeanRain = [UIImage imageNamed:@"shootingStar"];
            redBean.frame = CGRectMake(kScreenWidth, cellH * i, scale(106), scale(76));
            time = arc4random_uniform(10)/10.0;
        }
        redBean.image = redBeanRain;
        [self.listView addSubview:redBean];
        
        [UIView animateWithDuration:time animations:^{
            CGRect frame = redBean.frame;
            frame.origin.x -= (kScreenWidth+100);
            frame.origin.y += (kScreenWidth+100) * 76 / 106;
            redBean.frame = frame;
        } completion:^(BOOL finished) {
            [redBean removeFromSuperview];
        }];
    }
     */
}

- (void)clearLayer:(NSTimer *)timer
{
    CALayer *layer = [[timer userInfo] valueForKey:@"layer"];
    [layer removeFromSuperlayer];
}


#pragma mark -  手动触发 KVO
- (void)setExecuting:(BOOL)executing
{
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)setFinished:(BOOL)finished
{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

@end
