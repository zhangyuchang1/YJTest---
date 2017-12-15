//
//  AnimOperation.h
//  presentAnimation
//


#import <UIKit/UIKit.h>
#import "PresentView.h"
#import "GiftModel.h"

typedef void(^AnimOperationBlock)(void);
@interface AnimOperation : NSOperation
@property (nonatomic,strong) PresentView *presentView;
@property (nonatomic,strong) UIView *listView;
@property (nonatomic,strong) GiftModel *model;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,copy) AnimOperationBlock block;
@end