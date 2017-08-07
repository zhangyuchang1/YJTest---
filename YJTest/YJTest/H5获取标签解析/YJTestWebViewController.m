//
//  YJTestWebViewController.m
//  YJTest
//
//  Created by mac on 2017/7/29.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "YJTestWebViewController.h"

@interface YJTestWebViewController ()<UIWebViewDelegate>

@property (strong,nonatomic)NSString *currentURL; //当前页的url
@property (strong,nonatomic)NSString *currentTitle; //当前页标题 （不一定存在）


@end

@implementation YJTestWebViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor redColor];
    
    [super viewDidLoad];
    
    [self createwebview];
    
}

- (void)createwebview {
    
    
    _webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 65, 320, 480 - 65)];
    _webview.delegate = self;
    _webview.scalesPageToFit = YES;
    [self.view addSubview:_webview];
    
    NSURL *nsurl = [NSURL URLWithString:self.url];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:nsurl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    [_webview loadRequest:request];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    return NO;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    self.currentTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.currentURL = webView.request.URL.absoluteString;
    //    NSString *discrib = [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout = ‘none‘ "];
    NSString *jsDiscrib = @"document.getElementsByName('description')";
    NSString *discrib = [webView stringByEvaluatingJavaScriptFromString:jsDiscrib];
    NSLog(@"");
    
    //    NSLog(@"title-%@--url-%@--",self.currentTitle,self.currentURL);
    
    //    NSString *lJ  = @"document.documentElement.innerHTML";//获取当前网页的html
    //    self.currentHTML = [webView stringByEvaluatingJavaScriptFromString:lJs];
    
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
