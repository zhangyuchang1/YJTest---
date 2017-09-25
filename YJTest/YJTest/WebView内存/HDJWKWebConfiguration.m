//
//  HDJWKWebConfiguration.m
//  Vlink
//
//  Created by zyc on 2017/9/25.
//  Copyright © 2017年 myTV. All rights reserved.
//

#import "HDJWKWebConfiguration.h"

@interface HDJWKWebConfiguration()<WKScriptMessageHandler>

@end

@implementation HDJWKWebConfiguration

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self config];
    }
    return self;
}
-(void)config
{
    NSString *jSString = @"window.webkit.messageHandlers.AppNative.postMessage('')";
    WKUserScript *wkUserScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];
    WKUserContentController *wkVC = [WKUserContentController new];
    [wkVC addUserScript:wkUserScript];
    
    self.preferences.javaScriptEnabled = YES;
    self.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    self.userContentController = wkVC;
    [self.userContentController addScriptMessageHandler:self name:@"AppNative"];

}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    if ([message.name isEqualToString:@"AppNative"]) {
        NSDictionary *dic = message.body;
        if ([dic isKindOfClass:[NSDictionary class]]) {
            if (self.handleBlock) {
                self.handleBlock(dic);
            }
        }
    }
}
-(void)dealloc
{
    NSLog(@"HDJWKWebConfiguration - release");
}
@end
