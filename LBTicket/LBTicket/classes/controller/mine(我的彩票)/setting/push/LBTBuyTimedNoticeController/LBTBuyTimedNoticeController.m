//
//  LBTBuyTimedNoticeController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTBuyTimedNoticeController.h"

@interface LBTBuyTimedNoticeController ()

@end

@implementation LBTBuyTimedNoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提醒设置";
    
    LBTSettingSwitchItem *notice = [LBTSettingSwitchItem itemWithTitle:@"打开提醒"];
    // notice.key = ILSettingBuyTimedNotice;
    
    LBTSettingGroup *group = [LBTSettingGroup groupWithItems:@[notice]];
    group.headerTitle = @"您可以通过设置，提醒自己在开奖日不要忘了购买彩票";
    [self.groupArray addObject:group];
}



@end
