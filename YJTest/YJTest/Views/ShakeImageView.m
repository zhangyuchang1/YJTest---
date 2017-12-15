//
//  ShakeImageView.m
//  presentAnimation
//
//

#import "ShakeImageView.h"

@implementation ShakeImageView

- (void)startAnimWithDuration:(NSTimeInterval)duration {
    
    //    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
    //        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/3.0 animations:^{
    //
    //            self.transform = CGAffineTransformMakeScale(3, 3);
    //        }];
    //        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations:^{
    //
    //            self.transform = CGAffineTransformMakeScale(0.8, 0.8);
    //        }];
    //
    //        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations:^{
    //
    //            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
    //        }];
    //    } completion:nil];
    
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/2.0 animations:^{
            
            self.transform = CGAffineTransformMakeScale(4, 4);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/2.0 relativeDuration:1/2.0 animations:^{
            
            self.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:nil];
    }];
}


@end
