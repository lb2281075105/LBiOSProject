//
//  LBTSettingSwitchItem.h
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTSettingValueItem.h"

@interface LBTSettingSwitchItem : LBTSettingValueItem
/// 开关
@property (nonatomic, assign, getter = isOff) BOOL off;
@end
