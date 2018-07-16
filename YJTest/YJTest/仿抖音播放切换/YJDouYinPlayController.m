//
//  YJDouYinPlayController.m
//  YJTest
//
//  Created by zyc_hdj on 2018/6/27.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "YJDouYinPlayController.h"
#import "YJPlayCell.h"

@interface YJDouYinPlayController ()

@end

@implementation YJDouYinPlayController


/*
-(void)config
{
    _noDataView = [NoDataView setUpNoDataViewWithView:self ImageName:@"noRequestData" selected:NO];
    CGPoint center = _noDataView.center;
    center.y -= 80;
    _noDataView.center = center;
    _noDataView.hidden = YES;
    [self addSubview:_noDataView];
    
    
    self.delegate = self;
    self.dataSource = self;
    
    UINib *cellNib = [UINib nibWithNibName:@"SpaceListTableCell" bundle:[NSBundle mainBundle]];
    [self registerNib:cellNib forCellReuseIdentifier:@"SpaceListTableCell"];
}

-(void)setSpaceList:(NSArray<SpaceInfo *> *)spaceList
{
    _spaceList = spaceList;
    [self bringSubviewToFront:_noDataView];
    if (spaceList.count > 0) {
        _noDataView.hidden = NO;
    }else{
        _noDataView.hidden = YES;
    }
    
    [self reloadData];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.spaceList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SpaceListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpaceListTableCell"];
    if(self.spaceList.count > indexPath.row){
        SpaceInfo *spaceInfo = self.spaceList[indexPath.row];
        cell.spaceInfo = spaceInfo;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(self.spaceList.count > indexPath.row){
        SpaceInfo *spaceInfo = self.spaceList[indexPath.row];
        
        [HDJPushScheduler jumpLive:@(spaceInfo.spaceId).stringValue];
    }
}
*/
@end
