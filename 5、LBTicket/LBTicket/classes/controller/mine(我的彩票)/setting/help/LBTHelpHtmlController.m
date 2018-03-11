//
//  LBTHelpHtmlController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTHelpHtmlController.h"

@interface LBTHelpHtmlController ()<UIWebViewDelegate>{
    UIWebView *_webView;
}
@end

@implementation LBTHelpHtmlController
/// 只加载一次
- (void)loadView
{
    _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _webView.delegate = self;
    /// mark -- _webView赋值给self.view
    self.view = _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    /// 设置标题
    self.title = _htmlPage.title;
    
    /// 显示网页
    NSURL *url = [[NSBundle mainBundle] URLForResource:_htmlPage.html withExtension:nil];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    /// 设置左边的关闭
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/// webview代理方法
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    /// 加载框
}

/// 任何js代码都只能在这个方法调用后执行
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    /// 移出加载框
    if (_htmlPage.ID) {
        NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@';", _htmlPage.ID];
        [webView stringByEvaluatingJavaScriptFromString:js];
    }
}

@end
