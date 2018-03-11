//
//  LBTSettingTool.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTSettingTool.h"
#define LBTUserDefaults [NSUserDefaults standardUserDefaults]
@implementation LBTSettingTool
+ (void)setBool:(BOOL)b forKey:(NSString *)key
{
    [LBTUserDefaults setBool:b forKey:key];
    [LBTUserDefaults synchronize];
}

+ (BOOL)boolForKey:(NSString *)key
{
    return [LBTUserDefaults boolForKey:key];
}

+ (void)setObject:(id)obj forKey:(NSString *)key
{
    [LBTUserDefaults setObject:obj forKey:key];
    [LBTUserDefaults synchronize];
}

+ (id)objectForKey:(NSString *)key
{
    return [LBTUserDefaults objectForKey:key];
}
@end
