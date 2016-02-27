//
//  YJScrollLabel.m
//  YJScrollLabel
//
//  Created by zyc on 16/1/13.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "YJScrollLabel.h"
#import "UIView+YJ.h"
//间隔
#define LABEL_SPACE   (_space?_space:self.width/2.0)
//一个动画的时间  速度为1s滚动40个像素
#define SCROLL_SPEED_INTERVAL (_label_1.width+LABEL_SPACE)/40
@interface YJScrollLabel ()
@property (nonatomic,retain) UILabel *label_1;
@property (nonatomic,retain) UILabel *label_2;
@property (nonatomic,assign) BOOL     isAnimating;
/// 滚动速度，由1-10，速度由慢到快，默认为5
@property (nonatomic,assign) NSInteger speed;
@end
@implementation YJScrollLabel

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title speed:(NSInteger)speed
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        _label_1 = [[UILabel alloc] initWithFrame:CGRectZero];
        _label_1.backgroundColor = [UIColor clearColor];
        _label_1.text = title;
        _label_1.textColor = [UIColor whiteColor];
        _label_1.textAlignment = NSTextAlignmentCenter;
        
        _label_2 = [[UILabel alloc] initWithFrame:CGRectZero];
        _label_2.backgroundColor = [UIColor clearColor];
        _label_2.text = title;
        _label_2.textColor = [UIColor whiteColor];
        _label_2.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_label_1];
        [self addSubview:_label_2];
        self.clipsToBounds = YES;
        
        _speed = speed;
        CGFloat width = [self getLabelWidth];
        [_label_1 setFrame:CGRectMake(0, 0, width, self.height)];
        
        [_label_2 setFrame:CGRectMake(_label_1.width+LABEL_SPACE, 0, width, self.height)];
        
        if(width>self.width){
            [self animate];
        }else{
            //居中显示
            _label_1.left = (self.width-width)/2.0;
            [_label_2 setFrame:CGRectMake(_label_1.width+LABEL_SPACE, 0, width, self.height)];
            _label_2.hidden = YES;
        }
        
        
    }
    return self;
}

-(void)setTextColor:(UIColor *)textColor
{
    _label_1.textColor = textColor;
    _label_2.textColor = textColor;
}
-(void)animate
{
    // 两个label 滚动，前面滚完放到下一个label后面，循环
    //    MyLog(@"%f",SCROLL_SPEED_INTERVAL);
    self.isAnimating = YES;
    
    CGFloat interVal = SCROLL_SPEED_INTERVAL;
    if (_speed == 0) {
        _speed = 5;
    }
    if (_speed >10) {
        _speed = 10;
    }
    if (_speed <1) {
        _speed = 1;
    }
        interVal = SCROLL_SPEED_INTERVAL * 2 * (_speed/10.0);
    
    [UIView animateWithDuration:interVal delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat animations:^{
        
        _label_2.left = 0;
        _label_1.right = _label_2.left - LABEL_SPACE;
        
        
    } completion:^(BOOL finished) {
        
        [_label_1 setFrame:CGRectMake(_label_2.width+LABEL_SPACE, 0, _label_2.width, self.height)];
        
        [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            
            _label_1.left = 0;
            _label_2.right = _label_1.left - LABEL_SPACE;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];
    
}
-(CGFloat)getLabelWidth
{
    NSString *describtion = self.label_1.text;
    CGSize contextSize = CGSizeMake(10000, self.label_1.height);
    
    //计算时设置的字体大小,必须与显示文本的label的字体大小保持一致
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:self.label_1.font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGRect summaryRect = [describtion boundingRectWithSize:contextSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    CGFloat width = summaryRect.size.width;
    return width;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(void)setIsAllwaysAnimate:(BOOL)isAllwaysAnimate
{
    _isAllwaysAnimate = isAllwaysAnimate;
    
    if (_isAnimating) {
        return;
    }else if(isAllwaysAnimate){
        _label_2.hidden = NO;
        [self animate];
    }
    
}

@end
