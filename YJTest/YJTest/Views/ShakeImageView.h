//
//  ShakeImageView.h
//  presentAnimation
//
//

#import <UIKit/UIKit.h>

@interface ShakeImageView : UIImageView

// 动画时间
@property (nonatomic,assign) NSTimeInterval duration;
// 描边颜色
@property (nonatomic,strong) UIColor *borderColor;

- (void)startAnimWithDuration:(NSTimeInterval)duration;

@end
