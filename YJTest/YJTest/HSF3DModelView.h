//
//  HSF3DModelView.h
//  HSFGameDemo
//
//  Created by 黄山锋 on 2018/8/2.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SceneKit/SceneKit.h>

@interface HSF3DModelView : UIView
@property (nonatomic,strong) SCNScene *scnScene;//用于第一种方式
@property (nonatomic,strong) SCNSceneSource *sceneSource;//用于第二种方式
@property (nonatomic,strong) SCNNode *rootNode;
@property (nonatomic,strong) SCNNode *cameraNode;
@property (nonatomic,strong) SCNNode *lightNode;
@property (nonatomic,strong) SCNNode *ambientLightNode;
@property (nonatomic,strong) SCNView *scnView;
@property (nonatomic,copy) void (^HSF3DModelViewBlock)(void);


//*****************************************************************************//


#pragma mark 实用方法（简化）
-(void)hsf_create3DFromScnassets:(NSString *)fileName;
#pragma mark 实用方法二（简化）
-(void)hsf_create3DFromBundle:(NSString *)fileName;
#pragma mark 实用方法三（简化）
-(void)hsf_create3DWithNode:(SCNNode *)node;


//*****************************************************************************//

#pragma mark 1,创建一个SCNScene
//第一种方式：从本地资源库art.scnassets中获取
-(void)createScnSceneFromScnassets:(NSString *)fileName;
//第二种方式：从NSBundle中获取
-(void)createSceneSourceFromBundle:(NSString *)fileName;
//第三种方式：
-(void)createScnSceneWithNode:(SCNNode *)node;

#pragma mark 2,创建并添加一个SCNCamera
-(void)addCameraForScnScene:(SCNScene *)scnScene;


#pragma mark 3,创建并添加光源
-(void)addLightForScnScene:(SCNScene *)scnScene;


#pragma mark 4,创建并添加光源(Ambient)
-(void)addAmbientLightForScnScene:(SCNScene *)scnScene;


#pragma mark 5,创建一个SCNView
//scnView用于显示3D场景的视图, 类似于UIView的功能
//第一种方法
-(void)addScnViewWithScnScene:(SCNScene *)scnScene;
//第二种方法
-(void)addScnViewWithSceneSource:(SCNSceneSource *)sceneSource;


#pragma mark 7,绕y轴 一直旋转
-(void)rotateWithNode:(SCNNode *)node duration:(CGFloat)duration;


#pragma mark 8,给模型添加点击事件
-(void)addTapACTIONForScnView:(SCNView *)scnView;


@end
