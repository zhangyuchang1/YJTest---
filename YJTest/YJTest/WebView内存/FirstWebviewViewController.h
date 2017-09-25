//
//  FirstWebviewViewController.h
//  tv_shop
//
//  Created by TV on 16/7/7.
//  Copyright © 2016年 peraytech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

//@protocol MyJSExport1 <JSExport>
//
//JSExportAs(jumpProductDetails, -(void)jumpProductDetails:(NSString*)productId);
//JSExportAs(jumpLive, -(void)jumpLive:(NSString*)spaceId);
//
//@end

@interface FirstWebviewViewController : UIViewController

@property (nonatomic, strong) UIView *navcView;//导航视图
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *titlename;
//@property (nonatomic, strong) UIWebView *webview;
/// 是否显示分享按钮
@property (nonatomic, assign) BOOL isShowShareBtn;
@end
