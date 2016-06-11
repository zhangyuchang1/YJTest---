//
//  YJSearchController.m
//  YJTest
//
//  Created by zyc on 16/6/11.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "YJSearchController.h"
#import "YJSearchResultController.h"

@interface YJSearchController ()<UISearchControllerDelegate>
@property (retain, nonatomic) UISearchBar *searchBar;

@property (nonatomic,strong) UISearchController *searchController;
@property (nonatomic,assign) CGRect originalFrame;  //在改变self.view的frame改变之前记录它原来的尺寸
@property (nonatomic,retain) UITableView *table;

@end

@implementation YJSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 经测试 系统searchController 效果 必须要加载tableView上
    
    YJSearchResultController * conversationSearchVC = [[YJSearchResultController alloc]init];
    //    conversationSearchVC.rootViewController = self;
    _searchController = [[UISearchController alloc]initWithSearchResultsController:conversationSearchVC];
    _searchController.delegate = self;
    _searchController.searchResultsUpdater = conversationSearchVC;//更新结果设置代理
        _searchController.searchBar.placeholder = @"搜索";
        self.definesPresentationContext = YES;
        _searchController.searchBar.searchBarStyle = UISearchBarStyleDefault;
        _searchController.hidesNavigationBarDuringPresentation = NO;
        _searchController.dimsBackgroundDuringPresentation = NO;
    
    
    
    // 必须绑一个tableVIew 而且searchBar在 table的64高度处，tableView高度至少108
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 108) style:UITableViewStylePlain];
    //    _table.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_table];
    _table.backgroundColor = [UIColor greenColor];
    
    
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
    
    _table.tableHeaderView = self.searchBar;
    
    //    [self.view addSubview:self.searchBar];
    //
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISearchControllerDelegate
//- (void)willPresentSearchController:(UISearchController *)searchController
//{
////    self.tabBarController.tabBar.hidden = YES;
////    //改变self.view.frame  遮盖tabbar位置的黑条
////    _originalFrame = self.view.frame;
////    self.view.frame = CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT);
//
//    self.navigationController.navigationBarHidden = YES;
//}
//
//- (void)willDismissSearchController:(UISearchController *)searchController
//{
////    self.tabBarController.tabBar.hidden = NO;
////    //还原
////    self.view.frame = _originalFrame;
//
//    self.navigationController.navigationBarHidden = NO;

//}


#pragma mark - UISearchControllerDelegate
- (void)willPresentSearchController:(UISearchController *)searchController
{
    
    _table.frame = CGRectMake(0, 0, 320, 108);
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    //改变self.view.frame  遮盖tabbar位置的黑条
    _originalFrame = self.view.frame;
    self.view.frame = CGRectMake(0, 64, 320, 536);
}

- (void)willDismissSearchController:(UISearchController *)searchController
{
    
    _table.frame = CGRectMake(0, 200, 320, 108);
    
    self.navigationController.navigationBarHidden = NO;
    
    self.tabBarController.tabBar.hidden = NO;
    //还原
    self.view.frame = _originalFrame;
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
