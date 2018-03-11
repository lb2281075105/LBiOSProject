//
//  SocketNetworkManager.h
//  WebSocket
//
//  Created by 云媒 on 2017/7/11.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface SocketNetworkManager : AFHTTPSessionManager
+ (SocketNetworkManager *)shareInstance;
-(void)postwithUrl:(NSString *)url parameters:(NSDictionary *)parameters withBlock:(void (^)(NSDictionary *result, NSError *error))block;
@end
