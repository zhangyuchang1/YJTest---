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

-(void)addSubViews
{
    _scrollView = [[YJTestScrollScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.delegate = self;
    
    _scrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_scrollView];
    
    
    UIView *recmendView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    
    recmendView.backgroundColor = [UIColor purpleColor];
    
    [_scrollView addSubview:recmendView];
    
    
    
    
    _tableView = [[YJTestScrollTable alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, self.view.bounds.size.height - 44)];
    
    [self.scrollView addSubview:_tableView];
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, _tableView.frame.origin.y +_tableView.frame.size.height);
    
    
    [_tableView reloadData];
    

    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat y = _tableView.frame.origin.y;
    
//    if(offsetY >= y){
//        
//        _tableView.scrollEnabled = YES;
//        
//    }else{
//        _tableView.scrollEnabled = NO;
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
