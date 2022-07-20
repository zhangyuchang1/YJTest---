//
//  YJAuditionTesController.m
//  YJTest
//
//  Created by zyc on 2022/7/14.
//  Copyright © 2022 zyc. All rights reserved.
//

#import "YJAuditionTesController.h"
#import "Sark.h"
#import <objc/message.h>
#import "Sark+C.h"

@interface YJAuditionTesController ()

@end

@implementation YJAuditionTesController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    // --------------------------
    
    // 不能抽在方法里，运行会报错，只能写在这里
//    [self test1];
    
    NSLog(@"viewController = %@, 地址 = %p--%p", self, self,&self);

    id cls = [Sark class];
    NSLog(@"Sark class = %@, 地址 = %p",cls, &cls);

    void *obj = &cls;
    NSLog(@"Void *obj = %@ 地址 = %p", obj, &obj);
    [(__bridge id)obj speak];


    Sark *sark = [[Sark alloc] init];
    NSLog(@"Sark instance = %@ 地址 = %p", sark, &sark);
    [sark speak];
    
    

    NSLog(@" end -----");

    [sark singMusic];
}

- (void)test1{
    
    
    // vid是一个指针，用于表示OC 任意类型实例对象的指针，默认告诉编译器该指针指向的对象可以调用任何方法，
    id cls = [Sark class];
    
    // void *表示“任意类型的指针”
    void *obj = &cls;
    
//    ((void (*)(id, SEL))(void *)objc_msgSend)((id)cls, sel_registerName("sayHello"));

    [(__bridge id)obj speak];
    
    
    // 会打印出来：
    // my name is <YJAuditionTesController: 0x7ff4a00093d0>
    //
    
    /*
    objc_msgSendSuper2 解读
    // objc_msgSendSuper2() takes the current search class, not its superclass. OBJC_EXPORT id objc_msgSendSuper2(struct objc_super *super, SEL op, ...)
    __OSX_AVAILABLE_STARTING(__MAC_10_6, __IPHONE_2_0);
    objc_msgSendSuper2 方法入参是一个 objc_super *super。
    /// Specifies the superclass of an instance. struct objc_super {
        /// Specifies an instance of a class.
    __unsafe_unretained id receiver;
    /// Specifies the particular superclass of the instance to message. #if !defined(__cplusplus) && !__OBJC2__
    /* For compatibility with old objc-runtime.h header */
//        __unsafe_unretained Class class;
//    #else
//        __unsafe_unretained Class super_class;
//    #endif
//    /* super_class is the first class to search */ };
//    #endif
    /*
    所以按 viewDidLoad 执行时各个变量入栈顺序从高到底为 self, _cmd, self.class, self, obj。
    • 第一个 self 和第二个_cmd 是隐藏参数。
    • 第三个 self.class 和第四个 self 是[super viewDidLoad]方法执行时候的
    参数。
    • 在调用 self.name 的时候，本质上是 self 指针在内存向高位地址偏移一
    个指针。在 32 位下面，一个指针是 4 字节=4*8bit=32bit。(64 位不一样
    但是思路是一样的)
    • 从打印结果我们可以看到，obj 就是 cls 的地址。在 obj 向上偏移 32bit 就到了 0x7fff543f5aa8，这正好是 ViewController 的地址。
    所以输出为 my name is <ViewController: 0x7fb570e2ad00>。 至此，Objc 中的对象到底是什么呢?
    实质:Objc 中的对象是一个指向 ClassObject 地址的变量，即 id obj =
    &ClassObject ， 而对象的实例变量 void *ivar = &obj + offset(N)
    */
}

- (void)test2
{
    NSLog(@"viewController = %@, 地址 = %p--%p", self, self,&self);
    
    id cls = [Sark class];
    NSLog(@"Sark class = %@, 地址 = %p",cls, &cls);
    
    void *obj = &cls;
    NSLog(@"Void *obj = %@ 地址 = %p", obj, &obj);
    [(__bridge id)obj speak];
    
    
    Sark *sark = [[Sark alloc] init];
    NSLog(@"Sark instance = %@ 地址 = %p", sark, &sark);
    [sark speak];
    

}

- (void)allocAddress
{
    // 内存分配
    Sark * p1 = [Sark alloc];
    Sark * p2 = [p1 init];
    Sark * p3 = [p1 init];
    NSLog(@"%@ - %p - %p",p1,p1,&p1);
    NSLog(@"%@ - %p - %p",p2,p2,&p2);
    NSLog(@"%@ - %p - %p",p3,p3,&p3);

    // 结论：地址空间的创建来自于alloc， %p内存地址一样     ，&p指针地址不一样
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

-(void)didChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects
{
    
}
@end
