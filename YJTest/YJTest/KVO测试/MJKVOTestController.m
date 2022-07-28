//
//  MJKVOTestController.m
//  YJTest
//
//  Created by zyc on 2022/7/27.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "MJKVOTestController.h"
#import "KVOButton.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface MJKVOTestController ()

@property (nonatomic,strong) KVOButton *btn;

@end

@implementation MJKVOTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 参见小码哥的教程
    // KVO是怎么实现的，本质是什么？
    // 系统使用runtime动态生成的一个类，是KVOButton的一个子类，  isa-> NSKVONotifying_KVOButton 添加了kvo后类对象改变了
    
    _btn = [[KVOButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    _btn.backgroundColor = [UIColor grayColor];
    [_btn setTitle:@"KVOButton" forState:UIControlStateNormal];
    [self.view addSubview:_btn];
    _btn.value = 100;
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld;
    [_btn addObserver:self forKeyPath:@"value" options:options context:@"123"];
    


}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    [self methodTest];
    
    _btn.value = 1;
}
// 手动触发KVO
- (void)doKVO
{
    // 这两句都要有，实际是在didChangeValueForKey中，内部可能didChangeValueForKey判断
    [_btn willChangeValueForKey:@"value"];
    [_btn didChangeValueForKey:@"value"];
}

- (void) methodTest
{
    // 试试几种变化都会收到通知 4不会，
    
    // 1.
//    _btn.value = 1;
//
//    // 2.
//    [_btn setValue:2];
//
//    // 3.
//    [_btn performSelector:@selector(setValue:) withObject:@"3"];  // 数字传过去好像会有点问题，后续研究下
//    [_btn performSelector:@selector(setBackgroundColor:) withObject:[UIColor purpleColor]];
//
//     // 4.   不会出发kvo
//    _btn->_value = 4;
//
//    // 5.
//      objc_msgSend(_btn,sel_registerName("setValue:"),5);
//
    // 6.
//    object_getInstanceVariable(_btn,@"_value");
//    Ivar ivar = class_getInstanceVariable([KVOButton class], "_value");
//    NSInteger value = object_getIvar(_btn, ivar);
//    value = 6;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"监听到%@的属性%@发生了变化 \n%@ \n%@", object, keyPath,change,context);
    
    NSDictionary *dic = change;
    id new = dic[@"new"];
    NSInteger v = [new integerValue];
    
    id old = dic[@"old"];
    NSLog(@"老值： %@ - %zd  新值：%@", old,v, new);
    
    
}
-(void)dealloc
{
    [_btn removeObserver:self forKeyPath:@"value"];
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
