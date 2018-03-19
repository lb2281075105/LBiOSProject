//
//  LBDisplayPageController.m
//  LBDisplayPage
//
//  Created by liubo on 2018/3/15.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "LBDisplayPageController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
#import "UIView+Frame.h"
#import "Masonry.h"
@interface LBDisplayPageController ()<UIScrollViewDelegate,UIWebViewDelegate>
{
    AFHTTPSessionManager * _sessionManager;
}
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic ,strong) UIWebView *webView;
@property (nonatomic ,strong) UIScrollView *scrollView;
@end

@implementation LBDisplayPageController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpNet];
    [self setupUI];
    [self setUpDisplatPage];
    
}
- (void)setUpNet{
    _sessionManager = [AFHTTPSessionManager manager];
    _sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    _sessionManager.requestSerializer.timeoutInterval = 20;
    _sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
}
- (void)setupUI{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scrollView.scrollEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.alwaysBounceVertical = YES;
    _scrollView.bounces = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 230)];
    [_scrollView addSubview:_imageView];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 230, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 230)];
    _webView.delegate = self;
    _webView.scrollView.scrollEnabled = NO;
    [_scrollView addSubview:_webView];
    
}
- (void)setUpDisplatPage{
    
    [_sessionManager GET:@"http://www.we63.com/index.php" parameters:@{} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        NSString *code = [NSString stringWithFormat:@"%@",responseObject[@"code"]];
        if ([code isEqualToString:@"0"]) {
            NSURL *url = [NSURL URLWithString:responseObject[@"message"][@"thumb"]];
            [_imageView sd_setImageWithURL:url];
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:responseObject[@"message"][@"content"]]]];
        }else{
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
        
    }];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
        CGFloat offSet = scrollView.contentOffset.y + scrollView.contentInset.top;
        NSLog(@"%f",offSet);
//        if (offSet > 0) {
//            _imageView.height = 230;
//            _imageView.height = _imageView.height;
//            _imageView.y = - offSet;
//        }
//        else{
//            _imageView.y = 0;
//            _imageView.height = 230 - offSet;
//            _imageView.height = _imageView.height;
//        }
    
    if(scrollView.contentOffset.y<0) {
        
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }else{
        
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        
        CGFloat alpha=scrollView.contentOffset.y/90.0f>1.0f?1:scrollView.contentOffset.y/90.0f;
        
        [self.navigationController.navigationBar setBackgroundImage:[self getImageWithAlpha:alpha] forBarMetrics:UIBarMetricsDefault];
    }
    
}
-(UIImage *)getImageWithAlpha:(CGFloat)alpha{
    
    UIColor *color=[UIColor colorWithRed:1 green:0 blue:0 alpha:alpha];
    CGSize colorSize=CGSizeMake(1, 1);
    UIGraphicsBeginImageContext(colorSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    
    UIImage *img=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSArray *arr = [webView subviews];
    UIScrollView *scrollView = [arr objectAtIndex:0];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [scrollView  contentSize].height + 230);
    _webView.height = [scrollView  contentSize].height;
    NSLog(@"contentSize:%f",[scrollView  contentSize].height);
}
-(void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    self.webView = nil;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
@end
