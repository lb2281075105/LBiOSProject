//
//  LBTSettingLabelItem.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTSettingLabelItem.h"

@implementation LBTSettingLabelItem
- (void)setKey:(NSString *)key
{
    [super setKey:key];
    _text = [LBTSettingTool objectForKey:key];
}

- (void)setText:(NSString *)text
{
    _text = text;
    [LBTSettingTool setObject:text forKey:self.key];
}
@end
