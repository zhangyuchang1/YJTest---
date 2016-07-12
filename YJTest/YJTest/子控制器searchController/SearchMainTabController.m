//
//  SearchMainTabController.m
//  YJTest
//
//  Created by zyc on 16/7/13.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "SearchMainTabController.h"
#import "SearchControllerA.h"
#import "SearchControllerB.h"
#import "XIBConfiViewController.h"


@interface SearchMainTabController ()
@property (nonatomic,strong) UISegmentedControl *segContontrol;

@property (nonatomic,retain) SearchControllerA *conversationController;
@property (nonatomic,retain) SearchControllerB *friendController;

@end

@implementation SearchMainTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _conversationController = [[SearchControllerA alloc] init];
    
    __weak typeof(self) weakSelf = self;
    [_conversationController setSearchResultTap:^{
        
        XIBConfiViewController *xibVC = [[XIBConfiViewController alloc] init];
        [weakSelf.navigationController pushViewController:xibVC animated:YES];
        

        
    }];
    _friendController = [[SearchControllerB alloc] init];
    [_friendController setSearchResultTap:^{
        
        XIBConfiViewController *xibVC = [[XIBConfiViewController alloc] init];
        [weakSelf.navigationController pushViewController:xibVC animated:YES];
        
        
        
    }];

    
    [self configSegmentedControl];
    
    [self addChildViewController:_conversationController];
    [self addChildViewController:_friendController];
    
    
    //    _conversationController.view.frame = CGRectMake(0, 100, SCREEN_HEIGHT, SCREEN_HEIGHT)
    ;    [self.view addSubview:_conversationController.view];

}
- (void)configSegmentedControl
{
    _segContontrol = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"喵友"]];
    [_segContontrol setTintColor:[UIColor whiteColor]];
    [_segContontrol setWidth:64 forSegmentAtIndex:0];
    [_segContontrol setWidth:64 forSegmentAtIndex:1];
    
    [_segContontrol addTarget:self action: @selector(controlPressed:) forControlEvents: UIControlEventValueChanged];
    _segContontrol.selectedSegmentIndex = 0;
    
    self.navigationItem.titleView = _segContontrol;
  
}
- (void)controlPressed:(UISegmentedControl *)segContontrol
{
    
    if (segContontrol.selectedSegmentIndex == 0)
    {
        [self transitionFromViewController:_friendController toViewController:_conversationController duration:0 options:UIViewAnimationOptionCurveLinear animations:NULL completion:^(BOOL finished) {
            
        }];
    }
    else
    {
        [self transitionFromViewController:_conversationController toViewController:_friendController duration:0 options:UIViewAnimationOptionCurveLinear animations:NULL completion:^(BOOL finished) {
        }];
    }
    
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
