//
//  YJScrollViewController.m
//  YJTest
//  //t_dev_3
//  Created by zyc on 2017/8/3.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "YJScrollViewController.h"
#import "UIView+YJ.h"
#import "YJTestScrollView.h"

@interface YJScrollViewController ()<UIScrollViewDelegate>


@property (nonatomic,strong) YJTestScrollView *scrollView;
@property (nonatomic,strong) YJTestScrollView *childScrollView;

@end

@implementation YJScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[YJTestScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(self.view.width, 3*self.view.height);
    [self.view addSubview:_scrollView];
    
    
    _childScrollView = [[YJTestScrollView alloc] initWithFrame:CGRectMake(0, 200, self.view.width, 100)];
    _childScrollView.backgroundColor = [UIColor purpleColor];
    _childScrollView.contentSize = CGSizeMake(3*self.view.width, 100);
    _childScrollView.delegate = self;
    [_scrollView addSubview:_childScrollView];
    
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat offsetY = scrollView.contentOffset.x;
    
    NSLog(@"offset: %f  %f",offsetX,offsetY);
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
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
