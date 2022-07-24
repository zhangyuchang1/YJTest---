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
    
    
    self.dataArray = @[@"lastViewController 强引用",
                       @"XIB 实时动态显示圆角",
                       @"XIB 拉0.5的线",
                       @"跑马灯",
                       @"系统地图 显示poi",
                       @"自定义转场动画",
                       @"runtime",
                       @"searchViewController",
                       @"统计加定时上传模块",
                       @"VC 的view frame 变化",
                       @"圆角性能优化",
                       @"KVO测试",
                       @"子控制器searchController",
                       @"GCD练习",
                       @"Runnloop练习",
                       @"交叉滑动",
                       @"scroollView嵌套",
                       @"webView内存",
                       @"UITextFeild 完成按钮",
                       @"机器学习",
                       @"红豆角直播动画",
                       @"跳跳动画",
                       @"tableView高度测试",
                       @"内存地址测试",
                       @"XIB frame不对",
                       @"init方法尝试",
                       @"单例的block回调",
                       @"3D",
                       @"伪随机",
                       @"YYModel/MJ模型转字典",
                       @"view自己调remove",
                       @"父类方法递归尝试",
                       @"逻辑runtime讲解",
                       @"一些面试题调试",
                       @"touchesBegan事件链调试",
//                       @"描边大小的测试"
                       ];

    self.controllerArray = @[@"YJTestViewController",
                             @"XIBConfiViewController",
                             @"XIBLineViewController",
                             @"YJScrollTextViewController",
                             @"AppleMapViewController",
                             @"VCExchangeViewController",
                             @"RuntimeController",
                             @"YJSearchController",
                             @"YJStatisticController",
                             @"YJTestFrameTabarController",
                             @"YJCornerTestController",
                             @"KVOTestController",
                             @"SearchMainTabController",
                             @"GCDTestViewController",
                             @"RunloopTestController",
                             @"YJScrollViewController",
                             @"YJTestScrollViewController",
                             @"FirstWebviewViewController",
                             @"UITextFeildTestController",
                             @"CoreMLTestViewController",
                             @"HDJGiftAnimateController",
                             @"JumpAnimateVCViewController",
                             @"YJTableHeightTestController",
                             @"YJMemeryAddressTestController",
                             @"YJXIBFrameTestController",
                             @"YJTestInitController",
                             @"YLSingtonViewController",
                             @"YJ3DViewController",
                             @"YJRandViewController",
                             @"YJYYModelViewController",
                             @"YJViewRemoveController",
                             @"YJSuperMethedViewController",
                             @"YJLuoJiRunTimeController",
                             @"YJAuditionTestController",
                             @"YJTouchesTestController"
                            ];
    
    // 倒序一下
    NSMutableArray *tempAry = [self.dataArray mutableCopy];
    NSMutableArray *resultAry = [NSMutableArray array];
    for (NSString *str in tempAry) {
        [resultAry insertObject:str atIndex:0];
    }
    self.dataArray = [NSArray arrayWithArray:resultAry];
    
    tempAry = [self.controllerArray mutableCopy];
    [resultAry removeAllObjects];
    for (NSString *str in tempAry) {
        [resultAry insertObject:str atIndex:0];
    }
    self.controllerArray = [NSArray arrayWithArray:resultAry];
    

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
    
    if (indexPath.row == self.dataArray.count-1) {
        YJTestViewController *testViewController = [[YJTestViewController alloc] init];
        testViewController.lastViewController = self;
        //    [self.navigationController pushViewController:testViewController animated:YES];
        
        [self  presentViewController:testViewController animated:YES completion:NULL];
    }else{
        UIViewController* viewController = [[NSClassFromString([_controllerArray objectAtIndex:indexPath.row]) alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
