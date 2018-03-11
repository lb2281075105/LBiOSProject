//
//  LBTSettingGroup.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTSettingGroup.h"

@implementation LBTSettingGroup
+ (instancetype)groupWithItems:(NSArray *)items
{
    LBTSettingGroup *group = [[self alloc] init];
    group.items = items;
    return group;
}
@end
