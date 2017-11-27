//
//  CoreMLTestViewController.m
//  YJTest
//
//  Created by zyc on 2017/11/25.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "CoreMLTestViewController.h"
#import <CoreML/CoreML.h>
#import "MobileNet2.h"
#import "ImageTool.h"
#import <Vision/Vision.h>

@interface CoreMLTestViewController ()
@property (nonatomic,strong) UITextView *textView;

@property (nonatomic,strong) NSObject *currentModel;
@property (nonatomic,strong) NSArray *modelNames;
@end

@implementation CoreMLTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 60, 300, 400)];
    [self.view addSubview:_textView];
    
    
    // Do any additional setup after loading the view.
    
    _modelNames = @[@"MobileNet2",@"Inceptionv3",@"Resnet50",@"SqueezeNet",@"VGG16"];
    NSString *name = _modelNames[0];
    UIButton *selectModelBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height - 60 - 20, 200, 60)];
    selectModelBtn.backgroundColor = [UIColor greenColor];
    [selectModelBtn setTitle:name forState:UIControlStateNormal];
    [selectModelBtn addTarget:self action:@selector(changeModels:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectModelBtn];
    
    _currentModel = [[NSClassFromString(name) alloc] init];
    [self method4];
    
}
- (void)changeModels:(UIButton *)sender
{
    NSInteger index = ([_modelNames indexOfObject:sender.titleLabel.text ] + 1 ) % _modelNames.count;
    NSString *modelName = _modelNames[index];
    [sender setTitle:modelName forState:UIControlStateNormal];
    
    _currentModel = [[NSClassFromString(modelName) alloc] init];
    
    [self method4];
}
- (void)method1
{
    UIImage *image = [UIImage imageNamed:@"flowerTest.jpg"];
    
    CVPixelBufferRef imgBufferRef = [ImageTool pixelBufferFromCGImage:image.CGImage];
    
    MobileNet2Input *input = [[MobileNet2Input alloc] initWithImage:imgBufferRef];
    
    /// 用这种方法 path 拿不到
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MobileNet2" ofType:@"mlmodel"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"flowerTest" ofType:@"jpg"];
    
    //    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 不需要用这种方法初始化
    //    MobileNet2 *validate = [[MobileNet2 alloc] initWithContentsOfURL:url error:nil];
    
    //初始化方法  ios11 的 才可以 ，11之下系统会为nil
    MobileNet2 *validate2 = [[MobileNet2 alloc] init];
    
    //    MobileNet2Output *outPut = [validate predictionFromFeatures:input error:nil];
    //
    //    NSString *class_label = outPut.classLabel;
    
    NSLog(@"");
}
/// 最可能的结果
- (void)method2
{
    MobileNet2 *resnetModel = [[MobileNet2 alloc] init];
    UIImage *image = [UIImage imageNamed:@"flowerTest.jpg"];
    VNCoreMLModel *vnCoreModel = [VNCoreMLModel modelForMLModel:resnetModel.model error:nil];
    
    VNCoreMLRequest *vnCoreMlRequest = [[VNCoreMLRequest alloc] initWithModel:vnCoreModel completionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
        
        CGFloat confidence = 0.0f;
        VNClassificationObservation *tempClassification = nil;
        for (VNClassificationObservation *classification in request.results) {
            if (classification.confidence > confidence) {
                confidence = classification.confidence;
                tempClassification = classification;
            }
        }
        
        NSString *text = [NSString stringWithFormat:@"识别结果:%@",tempClassification.identifier];
        NSString *text2 = [NSString stringWithFormat:@"匹配率:%@",@(tempClassification.confidence)];
        NSLog(@"%@ \n %@",text,text2);
    }];
    
    VNImageRequestHandler *vnImageRequestHandler = [[VNImageRequestHandler alloc] initWithCGImage:image.CGImage options:nil];
    
    NSError *error = nil;
    [vnImageRequestHandler performRequests:@[vnCoreMlRequest] error:&error];
    
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }
    
}
/// 列出所有可能结果
- (void)method3
{
    MobileNet2 *resnetModel = [[MobileNet2 alloc] init];
    UIImage *image = [UIImage imageNamed:@"flowerTest.jpg"];
    VNCoreMLModel *vnCoreModel = [VNCoreMLModel modelForMLModel:resnetModel.model error:nil];
    
    VNCoreMLRequest *vnCoreMlRequest = [[VNCoreMLRequest alloc] initWithModel:vnCoreModel completionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
        
        CGFloat confidence = 0.01f;
        NSMutableArray <VNClassificationObservation *>*ficationArray = [NSMutableArray array];
        
        VNClassificationObservation *tempClassification = nil;
        for (VNClassificationObservation *classification in request.results) {
            if (classification.confidence > confidence) {
                
                [ficationArray addObject:classification];
            }
        }
        
        NSMutableString *resultStr = [NSMutableString stringWithString:@"识别结果：\n"];
        for (VNClassificationObservation *tempClassification in ficationArray) {
            NSString *oneItem = [NSString stringWithFormat:@"%@ ---可能性 %@",tempClassification.identifier,@(tempClassification.confidence)];
            [resultStr appendString:oneItem];
            [resultStr appendString:@"\n"];
        }
        
        _textView.text = resultStr;
    }];
    
    VNImageRequestHandler *vnImageRequestHandler = [[VNImageRequestHandler alloc] initWithCGImage:image.CGImage options:nil];
    
    NSError *error = nil;
    [vnImageRequestHandler performRequests:@[vnCoreMlRequest] error:&error];
    
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }
}

/// 用不同模型来判断
-(void)method4
{
    MLModel *model = [_currentModel performSelector:@selector(model)];
    
    UIImage *image = [UIImage imageNamed:@"flowerTest.jpg"];
    VNCoreMLModel *vnCoreModel = [VNCoreMLModel modelForMLModel:model error:nil];
    
    VNCoreMLRequest *vnCoreMlRequest = [[VNCoreMLRequest alloc] initWithModel:vnCoreModel completionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
        
        CGFloat confidence = 0.01f;
        NSMutableArray <VNClassificationObservation *>*ficationArray = [NSMutableArray array];
        
        VNClassificationObservation *tempClassification = nil;
        for (VNClassificationObservation *classification in request.results) {
            if (classification.confidence > confidence) {
                
                [ficationArray addObject:classification];
            }
        }
        
        NSMutableString *resultStr = [NSMutableString stringWithString:@"识别结果：\n"];
        for (VNClassificationObservation *tempClassification in ficationArray) {
            NSString *oneItem = [NSString stringWithFormat:@"%@ ---可能性 %@",tempClassification.identifier,@(tempClassification.confidence)];
            [resultStr appendString:oneItem];
            [resultStr appendString:@"\n"];
        }
        
        _textView.text = resultStr;
    }];
    
    VNImageRequestHandler *vnImageRequestHandler = [[VNImageRequestHandler alloc] initWithCGImage:image.CGImage options:nil];
    
    NSError *error = nil;
    [vnImageRequestHandler performRequests:@[vnCoreMlRequest] error:&error];
    
    if (error) {
        NSLog(@"%@",error.localizedDescription);
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

