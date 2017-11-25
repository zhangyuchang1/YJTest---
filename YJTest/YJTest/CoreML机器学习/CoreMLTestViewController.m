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

@interface CoreMLTestViewController ()

@end

@implementation CoreMLTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)method1
{
    UIImage *image = [UIImage imageNamed:@"flowerTest.jpg"];
    
    CVPixelBufferRef imgBufferRef = [ImageTool pixelBufferFromCGImage:image.CGImage];
    
    MobileNet2Input *input = [[MobileNet2Input alloc] initWithImage:nil];
    
    MobileNet2 *validate = [[MobileNet2 alloc] initWithContentsOfURL:nil error:nil];
    
    MobileNet2Output *outPut = [validate predictionFromFeatures:input error:nil];
}
- (void)method2
{
    /*
     Resnet50 *resnetModel = [[Resnet50 alloc] init];
     UIImage *image = self.selectedImageView.image;
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
     
     self.recognitionResultLabel.text = [NSString stringWithFormat:@"识别结果:%@",tempClassification.identifier];
     self.confidenceResult.text = [NSString stringWithFormat:@"匹配率:%@",@(tempClassification.confidence)];
     }];
     
     VNImageRequestHandler *vnImageRequestHandler = [[VNImageRequestHandler alloc] initWithCGImage:image.CGImage options:nil];
     
     NSError *error = nil;
     [vnImageRequestHandler performRequests:@[vnCoreMlRequest] error:&error];
     
     if (error) {
     NSLog(@"%@",error.localizedDescription);
     }
     
     */
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
