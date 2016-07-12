//
//  KVOTestController.m
//  YJTest
//
//  Created by zyc on 16/7/7.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "KVOTestController.h"
#import "KVOButton.h"


@interface KVOTestController ()

{
    KVOButton *button;
}
@end

@implementation KVOTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    button = [[KVOButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    button.backgroundColor = [UIColor grayColor];
//    button.vc = self;
    
    [self.view addSubview:button];
    
    
    //方法1 都可以
    [button addKVO];
    
    
    //方法2
    //  self 监听者， Button变化着
//    [button addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    //移除观察者 必须写在观察着里面， button为nil时也没关系
    [button removeObserver:self forKeyPath:@"value"];
    
    //错
//    [button removeKVVO];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    
    NSInteger value = [change[@"new"] integerValue];
    
    NSLog(@"%d",value);
//    if (value == 3) {
//        
//        
//        // 错误，必须要保证观察着没去掉检测之前 ，不能释放
//        [button removeFromSuperview];
//        button = nil;
//    }
    
    //应该
    if (value == 3) {
        
        [button removeObserver:self forKeyPath:@"value"];
        [button removeFromSuperview];
        button = nil;
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
