//
//  YJCornerCell.m
//  YJTest
//
//  Created by zyc on 16/6/20.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "YJCornerCell.h"
@interface YJCornerCell()

@property (nonatomic,retain) UIImageView *yjImageView;
@property (nonatomic,retain) UIView *view1;
@property (nonatomic,retain) UILabel *label;
@property (nonatomic,retain) UIButton *button;

@end

@implementation YJCornerCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
     
        _yjImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        _yjImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_yjImageView];
        
        _view1 = [[UIView alloc] initWithFrame:CGRectMake(10+40+5, 15, 30, 30)];
        _view1.backgroundColor = [UIColor  yellowColor];
        [self.contentView addSubview:_view1];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(10+40+5+30+5, 15, 30, 40)];
        _label.backgroundColor = [UIColor purpleColor];
        _label.text = @"label";
        [self.contentView addSubview:_label];
        
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor greenColor];
        _button.titleLabel.text = @"button";
        _button.frame = CGRectMake(self.bounds.size.width - 50 - 5,15, 50, 40);
        [_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
        
        
    }
    
    return self;
}
- (void)click:(UIButton *)button
{
    NSLog(@"诶呀喂~");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
