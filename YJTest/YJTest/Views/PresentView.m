//
//  PresentView.m
//  presentAnimation
//
//

#import "PresentView.h"
#import "UIView+YJ.h"

#define UIRandomColor   [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0f]


@interface PresentView ()
@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,copy) void(^completeBlock)(BOOL finished);
@end

@implementation PresentView

// 根据礼物个数播放动画
- (void)animateWithGiftTime:(CGFloat)giftTime CompleteBlock:(completeBlock)completed{
    if (self.giftCount > 10) {
        self.giftCount = (NSInteger)giftTime;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(fire) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }];
    self.completeBlock = completed;
}

- (void)fire{
    
    _animCount ++;
    if (_animCount == _giftCount) {
        [_timer invalidate];
        _timer = nil;
        [UIView animateWithDuration:0.35 delay:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.frame = CGRectMake(0, self.frame.origin.y - 20, self.frame.size.width, self.frame.size.height);
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self reset];
            _finished = finished;
            self.completeBlock(finished);
            [self removeFromSuperview];
        }];
    }
    
//    self.skLabel.text = [NSString stringWithFormat:@"X %ld",_animCount];
//    [self.skLabel startAnimWithDuration:0.25];
    if (self.model.giftCount < 50) {
        self.skImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"RedBeanNum_%ld", (long)_animCount]];
        [self.skImageView startAnimWithDuration:0.25];
    }
}

// 重置
- (void)reset {
    
    self.frame = _originFrame;
    self.alpha = 1;
    self.animCount = 0;
    self.skImageView.image = nil;
}

- (instancetype)init {
    if (self = [super init]) {
        
        [self setUI];
        _originFrame = self.frame;
    }
    return self;
}

#pragma mark 布局 UI
- (void)layoutSubviews {
    
    [super layoutSubviews];
    _headImageView.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
    _headImageView.layer.borderWidth = 1;
    _headImageView.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:0.3].CGColor;
    _headImageView.layer.cornerRadius = _headImageView.frame.size.height / 2;
    _headImageView.layer.masksToBounds = YES;
    _nameLabel.frame = CGRectMake(_headImageView.frame.size.width + 5, 5, _headImageView.frame.size.width * 3, 15);
    _giftImageView.frame = CGRectMake(self.frame.size.width - 50, self.frame.size.height - 50, 50, 50);
    CGSize giftLabelSize = [self.giftLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter" size:16],} context:nil].size;
//    _giftLabel.frame = CGRectMake(_nameLabel.frame.origin.x, CGRectGetMaxY(_headImageView.frame) - 10 - 5, _nameLabel.frame.size.width, 10);
    _giftLabel.frame = CGRectMake(_nameLabel.frame.origin.x, CGRectGetMaxY(_headImageView.frame) - 10 - 5, giftLabelSize.width + 5, 10);
    
    if (giftLabelSize.width > _nameLabel.size.width) {
        CGRect frame = self.frame;
        frame.size.width += (giftLabelSize.width - _nameLabel.size.width);
        self.frame = frame;
        _giftImageView.frame = CGRectMake(CGRectGetMaxX(_giftLabel.frame), self.frame.size.height - 50, 50, 50);
    }

    _bgImageView.frame = self.bounds;
    _bgImageView.layer.cornerRadius = self.frame.size.height / 2;
    _bgImageView.layer.masksToBounds = YES;
    
//    _skLabel.frame = CGRectMake(CGRectGetMaxX(self.frame) + 5,-10, 50, 30);
    _skImageView.frame = CGRectMake(CGRectGetMaxX(self.frame) + 5,-10, 51, 24);
    
    if (self.model.giftCount < 50) {
        return;
    }
    UIImage *giftImage = [UIImage imageNamed:[NSString stringWithFormat:@"RedBeanNum_%ld", (long)self.model.giftCount]];
    UIImageView *giftNumImgView = [[UIImageView alloc] initWithImage:giftImage];
    giftNumImgView.frame = CGRectMake(CGRectGetMaxX(self.frame) + 5,-10, giftImage.size.width * 24.0 / giftImage.size.height, 24);
    [self addSubview:giftNumImgView];
    
    /*
     //彩灯
     CGFloat pad = 14.0 * self.height / 80.0;
    UIImageView *colorful = [[UIImageView alloc] initWithFrame:CGRectMake(-pad, -pad, self.width + 2 * pad, self.height + 2 * pad)];
    [self addSubview:colorful];
    [self sendSubviewToBack:colorful];
    
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 1; i < 26; i++) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"colorful%d", i] ofType:@"png"];
        [mArray addObject:[UIImage imageWithContentsOfFile:path]];
    }
    [colorful setAnimationImages:mArray];
    [colorful setAnimationDuration:1.0];
    [colorful setAnimationRepeatCount:MAXFLOAT];
    [colorful startAnimating];
    */
    /*
     //颜色渐变layer
    CGFloat pad = 10.0;
    CAGradientLayer *colorfulEdge = [[CAGradientLayer alloc] init];
    colorfulEdge.frame = CGRectMake( - pad, - pad, self.width + 2 * pad, self.height + 2 * pad);
    colorfulEdge.cornerRadius = colorfulEdge.frame.size.height *0.5;
    colorfulEdge.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    colorfulEdge.startPoint = CGPointMake(0, 0);
    colorfulEdge.endPoint = CGPointMake(1, 1);
    [self.layer addSublayer:colorfulEdge];
    colorfulEdge.zPosition = -1;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:colorfulEdge forKey:@"colorfulEdge"];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(randomColor:) userInfo:dic repeats:YES];
     */
}

- (void)randomColor:(NSTimer *)timer
{
    CAGradientLayer *colorfulEdge = (CAGradientLayer *)[[timer userInfo] valueForKey:@"colorfulEdge"];
    colorfulEdge.colors = @[(__bridge id)UIRandomColor.CGColor,(__bridge id)UIRandomColor.CGColor];
}
#pragma mark 初始化 UI
- (void)setUI {
    
    _bgImageView = [[UIImageView alloc] init];
    _bgImageView.backgroundColor = [UIColor blackColor];
    _bgImageView.alpha = 0.3;
    _headImageView = [[UIImageView alloc] init];
    _giftImageView = [[UIImageView alloc] init];
    _nameLabel = [[UILabel alloc] init];
    _giftLabel = [[UILabel alloc] init];
    _nameLabel.textColor  = [UIColor whiteColor];
    _nameLabel.font = [UIFont systemFontOfSize:14];
    _giftLabel.textColor  = [UIColor yellowColor];
    _giftLabel.font = [UIFont systemFontOfSize:16];
    
    // 初始化动画label
//    _skLabel =  [[ShakeLabel alloc] init];
//    _skLabel.font = [UIFont systemFontOfSize:16];
//    _skLabel.borderColor = [UIColor yellowColor];
//    _skLabel.textColor = [UIColor greenColor];
//    _skLabel.textAlignment = NSTextAlignmentCenter;
    _skImageView = [[ShakeImageView alloc] init];
    _skImageView.backgroundColor = [UIColor clearColor];
    _animCount = 0;
    
    [self addSubview:_bgImageView];
    [self addSubview:_headImageView];
    [self addSubview:_giftImageView];
    [self addSubview:_giftLabel];
    [self addSubview:_nameLabel];
    [self addSubview:_skImageView];
//    [self addSubview:_skLabel];
}

- (void)setModel:(GiftModel *)model {
    _model = model;
    _headImageView.image = model.headImage;
    _giftImageView.image = model.giftImage;
    _nameLabel.text = model.name;
    _giftLabel.text = model.giftName;
    _giftCount = model.giftCount;
}

- (void)dealloc{
//    [self.timer invalidate];
//    self.timer = nil;
}

@end
