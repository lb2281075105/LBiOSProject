//
//  SocketNetworkManager.m
//  WebSocket
//
//  Created by 云媒 on 2017/7/11.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import "SocketNetworkManager.h"

@implementation SocketNetworkManager
{
    AFHTTPSessionManager * _sessionManager;
}
+(SocketNetworkManager *)shareInstance
{
    static SocketNetworkManager * shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self network];
    }
    return self;
}
- (void)network{

    //设置请求头参数
    _sessionManager = [AFHTTPSessionManager manager];
    _sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    _sessionManager.requestSerializer.timeoutInterval = 20;
    _sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    _sessionManager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
}

#pragma mark 数据请求封装
-(void)postwithUrl:(NSString *)url parameters:(NSDictionary *)parameters withBlock:(void (^)(NSDictionary *, NSError *))block
{
    [_sessionManager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
    }];
}
@end
