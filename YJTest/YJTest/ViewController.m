//
//  ViewController.m
//  YJTest
//
//  Created by zyc on 16/1/25.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "ViewController.h"
#import "YJTestViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain) NSArray *dataArray;
@property (nonatomic,retain) NSArray *controllerArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    
    self.dataArray = @[@"lastViewController 强引用",@"XIB 实时动态显示圆角",@"XIB 拉0.5的线",@"跑马灯",@"系统地图 显示poi",@"自定义转场动画",@"runtime",@"searchViewController",@"统计加定时上传模块",@"VC 的view frame 变化",@"圆角性能优化",@"KVO测试",@"子控制器searchController", @"GCD练习", @"Runnloop练习",@"交叉滑动"];
    self.controllerArray = @[@"YJTestViewController",@"XIBConfiViewController",@"XIBLineViewController",@"YJScrollTextViewController",@"AppleMapViewController",@"VCExchangeViewController",@"RuntimeController",@"YJSearchController",@"YJStatisticController",@"YJTestFrameTabarController",@"YJCornerTestController",@"KVOTestController",@"SearchMainTabController", @"GCDTestViewController", @"RunloopTestController", @"YJScrollViewController"];
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifer = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        YJTestViewController *testViewController = [[YJTestViewController alloc] init];
        testViewController.lastViewController = self;
        //    [self.navigationController pushViewController:testViewController animated:YES];
        
        [self  presentViewController:testViewController animated:YES completion:NULL];
    }

    if (indexPath.row > 0) {
        UIViewController* viewController = [[NSClassFromString([_controllerArray objectAtIndex:indexPath.row]) alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
