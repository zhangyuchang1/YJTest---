//
//  SearchControllerB.m
//  YJTest
//
//  Created by zyc on 16/7/13.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "SearchControllerB.h"
#import "SearchResultController.h"

#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)


@interface SearchControllerB ()<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate>
@property (nonatomic,strong) UISearchController *searchController;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,assign) BOOL  isNotFirst;

@end

@implementation SearchControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 48) style:UITableViewStylePlain];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 48);
    self.tableView.backgroundColor = [UIColor orangeColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView reloadData];
    
    
    SearchResultController *SearchResultVC = [[SearchResultController alloc]init];
    
    [SearchResultVC setSearchResultTap:^{
        
        if (self.searchResultTap) {
            
            self.searchResultTap();
        }
    }];
    //    conversationSearchVC.rootViewController = self;
    _searchController = [[UISearchController alloc]initWithSearchResultsController:SearchResultVC];
    _searchController.delegate = self;
    _searchController.searchResultsUpdater = SearchResultVC;//更新结果设置代理
    _searchController.searchBar.placeholder = @"搜索";
    self.definesPresentationContext = YES;
    _searchController.searchBar.searchBarStyle = UISearchBarStyleDefault;
    //        _searchController.hidesNavigationBarDuringPresentation = NO;
    //        _searchController.dimsBackgroundDuringPresentation = NO;
    
    
    
    
    //第二个控制器第一次 跳搜索栏 位置会骗
    
    //    self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    //    self.definesPresentationContext = YES;  // know where you want UISearchController to be displayed
    
    //
    //    _searchController.searchResultsUpdater = self;
    //    _searchController.dimsBackgroundDuringPresentation = NO;
    //    _searchController.hidesNavigationBarDuringPresentation = NO;
    //    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    //
    //    [[UILabel appearanceWhenContainedIn:[_searchController.searchBar class], nil] setTextColor:[CommonFuction colorFromHexRGB:App_BlackSixth_Color]];
    //    _searchController.searchBar.layer.borderWidth = 1;
    //    _searchController.searchBar.layer.borderColor = [CommonFuction colorFromHexRGB:App_BackgroundFrist_Color].CGColor;
    //    //取消以及光标
    //    _searchController.searchBar.tintColor = [CommonFuction colorFromHexRGB:App_OrangeFirst_Color];
    //    _searchController.searchBar.barTintColor = [CommonFuction colorFromHexRGB:App_BackgroundFrist_Color];
    //
    //    UITextField *searchField = [_searchController.searchBar valueForKey:@"_searchField"];
    //    searchField.placeholder = @"搜索";
    //    [searchField  setValue:[CommonFuction colorFromHexRGB:App_BlackSixth_Color] forKeyPath:@"_placeholderLabel.textColor"];
    //    UIImageView *leftViewImg = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,20,15)];
    //    leftViewImg.image = [UIImage imageNamed:@"search"];
    //    searchField.leftView = leftViewImg;
    //    searchField.leftViewMode = UITextFieldViewModeAlways;
    
    //    if (SCREEN_WIDTH == 320)
    //    {
    
    //遮罩层 为searchControll 的背景色
    _searchController.view.backgroundColor = [UIColor purpleColor];
    //    }
    //    else
    //    {
    //        _searchController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"searchBK"]];
    //    }
    //
    self.searchBar = _searchController.searchBar;
    //    [self.searchBar sizeToFit];
    
    //    [self.view bringSubviewToFront:_searchBar];
    self.searchBar.frame = CGRectMake(0, 0, 320, 44);
    
    self.tableView.tableHeaderView = self.searchBar;
    
    
    [self.tableView reloadData];
    
    
}
#pragma mark - UISearchControllerDelegate
- (void)willPresentSearchController:(UISearchController *)searchController
{
    
    if (!_isNotFirst) {
        
        self.tableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
        
    }
    self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
}

- (void)willDismissSearchController:(UISearchController *)searchController
{
    if (!_isNotFirst) {
        
        self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _isNotFirst = YES;
        
        
    }

}

-(void)didDismissSearchController:(UISearchController *)searchController
{
    //    [self.navigationController.navigationBar setShadowImage:[CommonFuction imageWithColor:[CommonFuction colorFromHexRGB:App_hLine_Color] size:CGSizeMake(SCREEN_WIDTH, 0.5)]];
    //
    //    self.tabBarController.tabBar.hidden = NO;
    //
    //    if (_fixView2)
    //    {
    //        [_fixView2 removeFromSuperview];
    //    }
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = @"ldldl";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
