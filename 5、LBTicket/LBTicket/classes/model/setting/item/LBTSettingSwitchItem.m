//
//  LBTSettingSwitchItem.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTSettingSwitchItem.h"

@implementation LBTSettingSwitchItem
- (void)setKey:(NSString *)key
{
    [super setKey:key];
    _off = [LBTSettingTool boolForKey:key];
}

- (void)setOff:(BOOL)off
{
    _off = off;
    [LBTSettingTool setBool:off forKey:self.key];
}
@end
