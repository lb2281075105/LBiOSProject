//
//  SocketModel.m
//  WebSocket
//
//  Created by 云媒 on 2017/7/7.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import "SocketModel.h"
#import "SocketGoodsModel.h"
@implementation SocketModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"goods" : [SocketGoodsModel class]
             };
}
@end
