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

#import "YJTestScrollManager.h"

@interface YJTestScrollViewController ()<UIScrollViewDelegate>
{
}
@property(nonatomic,strong) YJTestScrollScrollView *scrollView;
@property(nonatomic,strong) YJTestScrollTable *tableView;

@property(nonatomic,strong) YJTestScrollManager *manager;

@end

@implementation YJTestScrollViewController

- (void)viewDidLoad {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    /*
     
     automaticallyAdjustsScrollViewInsets，当设置为YES时（默认YES），如果视图里面存在唯一一个UIScrollView或其子类View，那么它会自动设置相应的内边距，这样可以让scroll占据整个视图，又不会让导航栏遮盖。
     
     当controller上的第一个子视图不是scrollview以及其子类的时候，就会取消内边距。此时原本全屏的scrollview设置的frame（0，0，self.view.frame.size.width，xx）就会从状态栏开始算起，如果应用有导航栏的话，那么就会遮盖住视图的64个高度
     
     解决方案:
     
     self.automaticallyAdjustsScrollViewInsets = NO；禁用掉自动设置的内边距，自行控制controller上index为0的控件以及scrollview控件的位置
     self.edgesForExtendedLayout = UIExtendedEdgeNone;这种方式设置，不需要再重新设置index为0的控件的位置以及scrollview的位置，（0，0）默认的依然是从导航栏下面开始算起

     
     */

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
    
    
    
    UIView *recmendView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300 - 50, 800)];
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
    _tableView = [[YJTestScrollTable alloc] initWithFrame:CGRectMake(0, 50, recmendView.width, recmendView.height - 50)];
//
    [self.scrollView addSubview:_tableView];
//
    // contentSize 大于scrollView的size才会滚动
//    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, _tableView.frame.origin.y +_tableView.frame.size.height);
    
    
    [_tableView reloadData];
    
    // 1
//    _scrollView.scrollEnabled = NO;
//    _tableView.scrollEnabled =
    
    
    _manager = [[YJTestScrollManager alloc] initWithBackground:_scrollView foreground:_tableView];
    _manager.bgScrollThreshold = 50;
    
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
//    CGFloat offsetY = scrollView.contentOffset.y;
//
//    CGFloat y = _tableView.frame.origin.y;
//
//    if(offsetY >= y){
//
//        _tableView.scrollEnabled = YES;
////        self.scrollView.scrollEnabled = NO;
//
//    }else{
////        _tableView.scrollEnabled = NO;
//
//     }
    
    
    
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
