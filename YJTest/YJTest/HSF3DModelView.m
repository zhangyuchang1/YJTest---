//
//  HSF3DModelView.m
//  HSFGameDemo
//
//  Created by 黄山锋 on 2018/8/2.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSF3DModelView.h"

#import <SceneKit/SceneKit.h>

@interface HSF3DModelView ()

@end

@implementation HSF3DModelView



#pragma mark 实用方法一（简化）
-(void)hsf_create3DFromScnassets:(NSString *)fileName{
    [self createScnSceneFromScnassets:fileName];
    [self addCameraForScnScene:self.scnScene];
    [self addLightForScnScene:self.scnScene];
    [self addAmbientLightForScnScene:self.scnScene];
    [self addScnViewWithScnScene:self.scnScene];
    [self addSubview:self.scnView];
    [self addTapACTIONForScnView:self.scnView];
}
#pragma mark 实用方法二（简化）
-(void)hsf_create3DFromBundle:(NSString *)fileName{
    [self createSceneSourceFromBundle:fileName];
    [self addCameraForScnScene:self.scnScene];
    [self addLightForScnScene:self.scnScene];
    [self addAmbientLightForScnScene:self.scnScene];
    [self addScnViewWithSceneSource:self.sceneSource];
    [self addSubview:self.scnView];
    [self addTapACTIONForScnView:self.scnView];
}
#pragma mark 实用方法三（简化）
-(void)hsf_create3DWithNode:(SCNNode *)node{
    [self createScnSceneWithNode:node];
    [self addCameraForScnScene:self.scnScene];
    [self addLightForScnScene:self.scnScene];
    [self addAmbientLightForScnScene:self.scnScene];
    [self addScnViewWithScnScene:self.scnScene];
    [self addSubview:self.scnView];
    [self rotateWithNode:self.scnScene.rootNode.childNodes.firstObject duration:5];
    [self addTapACTIONForScnView:self.scnView];
}











#pragma mark 1,创建一个SCNScene
//第一种方式：从本地资源库art.scnassets中获取
-(void)createScnSceneFromScnassets:(NSString *)fileName{
    SCNScene *scnScene = [[SCNScene alloc]init];
    NSString *sceneFilePath = [NSString stringWithFormat:@"art.scnassets/%@",fileName];
    SCNScene *scene = [SCNScene sceneNamed:sceneFilePath];
    SCNNode *node = scene.rootNode.childNodes.firstObject;
//    node.transform = SCNMatrix4MakeScale(.05, .05, .05);//大小缩放
    //把节点添加到场景
    [scnScene.rootNode addChildNode:node];
    
    self.scnScene = scnScene;
    self.rootNode = node;
}
//第二种方式：从NSBundle中获取
-(void)createSceneSourceFromBundle:(NSString *)fileName{
    SCNSceneSource *sceneSource = [SCNSceneSource sceneSourceWithURL:[[NSBundle mainBundle] URLForResource:fileName withExtension:@""] options:nil];
    self.sceneSource = sceneSource;
}
//第三种方式：根据node创建
-(void)createScnSceneWithNode:(SCNNode *)node{
    SCNScene *scnScene = [[SCNScene alloc]init];
    //大小缩放：node.transform = SCNMatrix4MakeScale(5, 5, 5);
    //把节点添加到场景
    [scnScene.rootNode addChildNode:node];
    self.scnScene = scnScene;
}


#pragma mark 2,创建并添加一个SCNCamera
-(void)addCameraForScnScene:(SCNScene *)scnScene{
    SCNNode *cameraNode = [[SCNNode alloc]init];
    //给相机节点赋值相机
    cameraNode.camera = [[SCNCamera alloc]init];
    //设置视角的位置, x:0,y:0就是中心点, z只代表观察的距离, z越大, 物体越小
    cameraNode.position = SCNVector3Make(0, 0, 15);
    //视距
    cameraNode.camera.zFar = 400;
    //把相机的节点添加到根节点里面
    [scnScene.rootNode addChildNode:cameraNode];
    self.cameraNode = cameraNode;
}


#pragma mark 3,创建并添加光源
-(void)addLightForScnScene:(SCNScene *)scnScene{
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = [SCNLight light];
    lightNode.light.type = SCNLightTypeOmni;
    lightNode.position = SCNVector3Make(0, 10, 10);
    [scnScene.rootNode addChildNode:lightNode];
    self.lightNode = lightNode;
}


#pragma mark 4,创建并添加光源(Ambient)
-(void)addAmbientLightForScnScene:(SCNScene *)scnScene{
    SCNNode *ambientLightNode = [SCNNode node];
    ambientLightNode.light = [SCNLight light];
    ambientLightNode.light.type = SCNLightTypeAmbient;
    ambientLightNode.light.color = [UIColor darkGrayColor];
    [scnScene.rootNode addChildNode:ambientLightNode];
    self.ambientLightNode = ambientLightNode;
}


#pragma mark 5,创建一个SCNView
//scnView用于显示3D场景的视图, 类似于UIView的功能
//第一种方法
-(void)addScnViewWithScnScene:(SCNScene *)scnScene{
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.bounds];
    scnView.showsStatistics = YES;//显示统计数据
    scnView.allowsCameraControl = YES;//这个属性是让你的场景可以接受一些内置的手势操作, 比如放大缩小
    scnView.autoenablesDefaultLighting = YES;//自动启用默认光源
    scnView.backgroundColor = [UIColor blackColor];//背景色
    scnView.scene = scnScene;//给当前的SCNView 赋值SCNScene
    self.scnView = scnView;
}
//第二种方法
-(void)addScnViewWithSceneSource:(SCNSceneSource *)sceneSource{
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.bounds];
    scnView.showsStatistics = YES;//显示统计数据
    scnView.allowsCameraControl = YES;//这个属性是让你的场景可以接受一些内置的手势操作, 比如放大缩小
    scnView.autoenablesDefaultLighting = YES;//自动启用默认光源
    scnView.backgroundColor = [UIColor blackColor];//背景色
    scnView.scene = [sceneSource sceneWithOptions:nil error:nil];//给当前的SCNView 赋值sceneSource
    [self addSubview:scnView];
    self.scnView = scnView;
}

#pragma mark 7,绕y轴 一直旋转
-(void)rotateWithNode:(SCNNode *)node duration:(CGFloat)duration{
    [self.rootNode runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:2 z:0 duration:duration]]];
}

#pragma mark 8,给模型添加点击事件
-(void)addTapACTIONForScnView:(SCNView *)scnView{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapACTION:)];
    [scnView addGestureRecognizer:tap];
}
/* 点击模型 */
-(void)tapACTION:(UITapGestureRecognizer *)sender{
    // 获取模型点击处的三维坐标
    SCNView *scnView = (SCNView *)sender.view;
    SCNVector3 projectedOrigin = [scnView projectPoint:SCNVector3Zero];
    CGPoint vp = [sender locationInView:scnView];
    SCNVector3 vpWithZ = SCNVector3Make(vp.x, vp.y, projectedOrigin.z);
    SCNVector3 worldPoint = [scnView unprojectPoint:vpWithZ];
    NSLog(@"x: --- %f y: --- %f z: --- %f", worldPoint.x, worldPoint.y, worldPoint.z);
    
    if (self.HSF3DModelViewBlock) {
        self.HSF3DModelViewBlock();
    }
}





@end
