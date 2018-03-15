//
//  LBDisplayPageController.m
//  LBDisplayPage
//
//  Created by liubo on 2018/3/15.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "LBDisplayPageController.h"
#import "AFNetworking.h"
@interface LBDisplayPageController ()
{
    AFHTTPSessionManager * _sessionManager;
}
@end

@implementation LBDisplayPageController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpNet];
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
- (void)setUpDisplatPage{
    
    [_sessionManager GET:@"http://www.we63.com/index.php" parameters:@{} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        NSString *code = [NSString stringWithFormat:@"%@",responseObject[@"code"]];
        if ([code isEqualToString:@"0"]) {
//            NSURL *url = [NSURL URLWithString:responseObject[@"message"][@"thumb"]];
//            [_imageView sd_setImageWithURL:url];
//            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:responseObject[@"message"][@"content"]]]];
        }else{
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
        
    }];
    
}
@end
