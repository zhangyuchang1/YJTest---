//
//  FirstWebviewViewController.m
//  tv_shop
//
//  Created by TV on 16/7/7.
//  Copyright © 2016年 peraytech. All rights reserved.
//

#import "FirstWebviewViewController.h"
//#import "ProductsDetailsPageVC.h"
//#import "LZBShare.h"
//#import "SpaceInfoEnterSpaceApi.h"
//#import "ProtocLiveInfo.pbobjc.h"
#import <WebKit/WebKit.h>
#import "HDJWKWebConfiguration.h"

static NSString *testUrl = @"http://wap.hongdoujiao.tv/activity/dazhaxie/index.html";
@interface FirstWebviewViewController ()<UIWebViewDelegate, WKNavigationDelegate> {
}

@property (strong,nonatomic)NSString *currentURL; //当前页的url
@property (strong,nonatomic)NSString *currentTitle; //当前页标题 （不一定存在）
//@property (strong,nonatomic)JSContext *context;

@property (strong, nonatomic) WKWebView *webView;

@property (strong, nonatomic) HDJWKWebConfiguration *wkWebConfig;


@end

@implementation FirstWebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createwebview];
    [self loadWebView];
}

- (void)createwebview {
    /*
    _navcView = [self setCustomNavigationTitle:_titlename];
    if(_isShowShareBtn){
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(kScreenWidth - 33, 30, 25, 25);
        [rightBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [rightBtn setImage:[UIImage imageNamed:@"share_icon_black"] forState:UIControlStateNormal];
        [_navcView addSubview:rightBtn];
    }

    [self.view addSubview:_navcView];
     */
}

- (void)loadWebView {
//    _webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 65, kScreenWidth, kScreenHeight - 65)];
//    _webview.delegate = self;
//    //    _webview.scalesPageToFit = YES;
//    [self.view addSubview:_webview];
//    
//    NSURL *nsurl = [NSURL URLWithString:self.url];
//    
//    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:nsurl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
//    [_webview loadRequest:request];
    

    
    _wkWebConfig = [[HDJWKWebConfiguration alloc] init];
    __weak typeof(self)weakSelf = self;
    _wkWebConfig.handleBlock = ^(NSDictionary *responseDic) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf handleJSAction:responseDic];
    };
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 65, 320, 480 - 65) configuration:_wkWebConfig];
    _webView.navigationDelegate = self;
    //    _webview.scrollView.scrollEnabled = NO;
    _webView.scrollView.bounces = NO;
    [self.view addSubview:_webView];
    
//    [_webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://10.110.18.122:8080/"]]];
    
    NSURL *nsurl = [NSURL URLWithString:testUrl];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:nsurl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    [_webView loadRequest:request];
}

//- (void)webViewDidStartLoad:(UIWebView *)webView {
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    self.context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    // 打印异常
//    self.context.exceptionHandler =
//    ^(JSContext *context, JSValue *exceptionValue)
//    {
//        context.exception = exceptionValue;
//        NSLog(@"%@", exceptionValue);
//    };
//    
//    // 以 JSExport 协议关联 native 的方法
//    self.context[@"AppNative"] = self;
//}

//- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
//    
//
//    
//}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //[MBProgressHUD hideHUDForView:self.view animated:YES];
    
    self.currentTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.currentURL = webView.request.URL.absoluteString;
//    NSString *discrib = [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout = ‘none‘ "];
    NSString *jsDiscrib = @"document.getElementsByName('description')";
    NSString *discrib = [webView stringByEvaluatingJavaScriptFromString:jsDiscrib];
    NSLog(@"");
    
    NSLog(@"title-%@--url-%@--",self.currentTitle,self.currentURL);
    
    NSString *lJ  = @"document.documentElement.innerHTML";//获取当前网页的html
    self.currentURL = [webView stringByEvaluatingJavaScriptFromString:lJ];
}
/// JS事件
-(void)handleJSAction:(NSDictionary *)dic
{
//    1 保证金 2 跳直播 3 跳详情页 
    NSString *type = dic[@"type"];
    
    if ([type isEqualToString:@"1"]) {
        
    }
    if ([type isEqualToString:@"2"]) {
        NSString *spaceId = dic[@"spaceId"];
        [self jumpLive:spaceId];
    }
    if ([type isEqualToString:@"3"]) {
        NSString *productId = dic[@"productId"];
        [self jumpProductDetails:productId];
    }
 
}
#pragma mark ============ 跳转到店铺详情 和直播界面 ==========
- (void)jumpProductDetails:(NSString *)productId {
    //[HDJPushScheduler jumpProductDetails:productId];
}

- (void)jumpLive:(NSString *)spaceId {
    //[HDJPushScheduler jumpLive:spaceId];
}

//重写返回按钮
- (void)onBackBtn {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    } else {
        [self.view resignFirstResponder];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - 分享按钮
//分享
- (void)shareBtnClick:(UIButton *)sender {

}

/**
 *  解析URL参数
 *
 *  @param param 想要获取参数的名字
 *  @param url   url地址
 *
 *  @return 对应参数
 */
-(NSString *)fetchUrlParam:(NSString *)param url:(NSString *)url {
    NSError *error;
    NSString *regTags=[[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)",param];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    // 执行匹配的过程
    NSArray *matches = [regex matchesInString:url
                                      options:0
                                        range:NSMakeRange(0, [url length])];
    for (NSTextCheckingResult *match in matches) {
        return [url substringWithRange:[match rangeAtIndex:2]];
    }
    
    return nil;
}

#pragma mark - navigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation { // 类似UIWebView的 -webViewDidStartLoad:
    NSLog(@"didStartProvisionalNavigation");
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"didCommitNavigation");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation { // 类似 UIWebView 的 －webViewDidFinishLoad:
    NSLog(@"didFinishNavigation");
    if (webView.title.length > 0) {
        self.title = webView.title;
    }
    /*
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    self.currentTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.currentURL = webView.request.URL.absoluteString;
    //    NSString *discrib = [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout = ‘none‘ "];
    NSString *jsDiscrib = @"document.getElementsByName('description')";
    NSString *discrib = [webView stringByEvaluatingJavaScriptFromString:jsDiscrib];
    NSLog(@"");
    
    NSLog(@"title-%@--url-%@--",self.currentTitle,self.currentURL);
    
    NSString *lJ  = @"document.documentElement.innerHTML";//获取当前网页的html
    self.currentURL = [webView stringByEvaluatingJavaScriptFromString:lJ];
    */
}
-(void)dealloc
{
    [_wkWebConfig.userContentController removeScriptMessageHandlerForName:@"AppNative"];
    _wkWebConfig = nil;
//    [[_webView configuration].userContentController removeScriptMessageHandlerForName:@"closeMe"];
}


@end














