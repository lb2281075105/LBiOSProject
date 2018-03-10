//
//  LBTSettingItem.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTSettingItem.h"

@implementation LBTSettingItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    LBTSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}
@end
