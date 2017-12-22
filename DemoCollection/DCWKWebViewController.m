//
//  DCWKWebViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/2.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCWKWebViewController.h"
#import <WebKit/WebKit.h>


@interface DCWKWebViewController ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic,strong) WKWebView *webView;
@end

@implementation DCWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = ({
        WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        [webView loadRequest:[NSURLRequest requestWithURL:[[NSURL alloc] initWithString:@"https://www.baidu.com"]]];
        webView.UIDelegate = self;
        webView.navigationDelegate = self;
        [self.view addSubview:webView];
        webView;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - WKUIDelegate
- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    return nil;
}

- (void)webViewDidClose:(WKWebView *)webView {
    NSLog(@"webViewDidClose");
}

/*! @abstract Displays a JavaScript alert panel.
 @param webView The web view invoking the delegate method.
 @param message The message to display.
 @param frame Information about the frame whose JavaScript initiated this
 call.
 @param completionHandler The completion handler to call after the alert
 panel has been dismissed.
 @discussion For user security, your app should call attention to the fact
 that a specific website controls the content in this panel. A simple forumla
 for identifying the controlling website is frame.request.URL.host.
 The panel should have a single OK button.
 
 If you do not implement this method, the web view will behave as if the user selected the OK button.
 */
//
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    NSLog(@"- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler;");
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    
}
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler{
    
}

- (BOOL)webView:(WKWebView *)webView shouldPreviewElement:(WKPreviewElementInfo *)elementInfo {
    NSLog(@"elementInfo = %@",elementInfo);
    return YES;
};

- (nullable UIViewController *)webView:(WKWebView *)webView previewingViewControllerForElement:(WKPreviewElementInfo *)elementInfo defaultActions:(NSArray<id <WKPreviewActionItem>> *)previewActions {
    
    return nil;
}

- (void)webView:(WKWebView *)webView commitPreviewingViewController:(UIViewController *)previewingViewController {
    [self.navigationController pushViewController:previewingViewController animated:YES];
};

#pragma mark - WKNavigationDelegate
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    
//};

/*! @abstract Invoked when a main frame navigation starts.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"main frame navigation starts");
};

/*! @abstract Invoked when a server redirect is received for the main
 frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"for provisional 收到 server redirect，开始跳转");
};

/*! @abstract Invoked when an error occurs while starting to load data for
 the main frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 @param error The error that occurred.
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"did fail provisional navigation");
};

/*! @abstract Invoked when content starts arriving for the main frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
//开始收到 web 内容
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"the web view begins to receive web content，开始接受web内容");
};

/*! @abstract Invoked when a main frame navigation completes.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"main frame navigation completes 主导航完成");
};

/*! @abstract Invoked when an error occurs during a committed main frame
 navigation.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 @param error The error that occurred.
 */
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"an error occurs during a committed main frame navigation 主导航加载出错");
};

/*! @abstract Invoked when the web view needs to respond to an authentication challenge.
 @param webView The web view that received the authentication challenge.
 @param challenge The authentication challenge.
 @param completionHandler The completion handler you must invoke to respond to the challenge. The
 disposition argument is one of the constants of the enumerated type
 NSURLSessionAuthChallengeDisposition. When disposition is NSURLSessionAuthChallengeUseCredential,
 the credential argument is the credential to use, or nil to indicate continuing without a
 credential.
 @discussion If you do not implement this method, the web view will respond to the authentication challenge with the NSURLSessionAuthChallengeRejectProtectionSpace disposition.
 */
//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
//    NSLog(@"收到身份验证");
//};

/*! @abstract Invoked when the web view's web content process is terminated.
 @param webView The web view whose underlying web content process was terminated.
 */
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    NSLog(@"web view 的 web 内容 停止加载");
};
@end
