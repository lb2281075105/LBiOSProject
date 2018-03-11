//
//  LBSingle.m
//  LBBootPage
//
//  Created by liubo on 2018/3/8.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "LBSingle.h"

@implementation LBSingle
/// 是否是第一次加载引导页
- (void)setLoadBootPage:(BOOL)key{
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:key forKey:@"keyFirst"];
    [ud synchronize];
}
/// 是否是第一次加载引导页
- (BOOL)getLoadBootPage{
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    return [ud boolForKey:@"keyFirst"];
}
+ (LBSingle *)defaultSingle
{
    static LBSingle * single;
    if (!single) {
        single = [[LBSingle alloc] init];
    }
    return single;
}
@end
