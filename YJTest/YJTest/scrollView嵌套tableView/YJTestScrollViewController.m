//
//  YJTestScrollViewController.m
//  YJTest
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "YJTestScrollViewController.h"
#import "YJTestScrollTable.h"
#import "YJTestScrollScrollView.h"

@interface YJTestScrollViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) YJTestScrollScrollView *scrollView;
@property(nonatomic,strong) YJTestScrollTable *tableView;


@end

@implementation YJTestScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    
    [self addSubViews];
    
}
- (void)info
{
    //shouldRecognizeSimultaneouslyWithGestureRecognizer 代理中
    // 默认为NO。子视图滑动不影响父视图，两个不影响
    // 子视图设为YES时，子视图滑动，父视图会跟着滑
    //
    
}
-(void)addSubViews
{
    _scrollView = [[YJTestScrollScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHight - 64)];
    _scrollView.delegate = self;
    
    _scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yj_test_img.png"]];
    [self.view addSubview:_scrollView];
    
    
    
    UIView *recmendView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 300 - 50, 800)];
    recmendView.backgroundColor = [UIColor redColor];
                                   
    [self.scrollView addSubview:recmendView];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 800 + 64);
    
//
//
//    recmendView.backgroundColor = [UIColor purpleColor];
//
//    [_scrollView addSubview:recmendView];
//
//
//
//
    _tableView = [[YJTestScrollTable alloc] initWithFrame:CGRectMake(0, 20, recmendView.width, recmendView.height - 20)];
//
    [self.scrollView addSubview:_tableView];
//
    // contentSize 大于scrollView的size才会滚动
//    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, _tableView.frame.origin.y +_tableView.frame.size.height);
    
    
    [_tableView reloadData];
    
    // 1
//    _scrollView.scrollEnabled = NO;
//    _tableView.scrollEnabled =
    
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat y = _tableView.frame.origin.y;
    
    if(offsetY >= y){
        
        _tableView.scrollEnabled = YES;
        
    }else{
        _tableView.scrollEnabled = NO;

     }
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
