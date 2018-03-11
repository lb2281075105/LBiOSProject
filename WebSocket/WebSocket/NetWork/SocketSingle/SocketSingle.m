//
//  SocketSingle.m
//  WebSocket
//
//  Created by 云媒 on 2017/7/11.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import "SocketSingle.h"

@implementation SocketSingle
+ (SocketSingle *)defaultSingle
{
    static SocketSingle * single;
    if (!single) {
        single = [[SocketSingle alloc] init];
    }
    return single;
}
///是否是第一次
- (void)setValueWithFirst:(BOOL)isFirst
{
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:isFirst forKey:@"isFirst"];
    [ud synchronize];
}
///是否是第一次
- (BOOL)getTheValueOfFirst
{
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    return [ud boolForKey:@"isFirst"];
}
@end
