//
//  YJTestScrollTable.m
//  YJTest
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "YJTestScrollTable.h"
@interface YJTestScrollTable()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation YJTestScrollTable

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self config];
    }
    
    return self;
}

-(void)config
{
    self.delegate = self;
    self.dataSource = self;
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YJTestScrollTableCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"cell____%d",indexPath.row];
    
    return cell;
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
