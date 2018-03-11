//
//  SocketSingle.h
//  WebSocket
//
//  Created by 云媒 on 2017/7/11.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketSingle : NSObject
+ (SocketSingle *)defaultSingle;
///是否是第一次
- (void)setValueWithFirst:(BOOL)isFirst;
///是否是第一次
- (BOOL)getTheValueOfFirst;
@end
