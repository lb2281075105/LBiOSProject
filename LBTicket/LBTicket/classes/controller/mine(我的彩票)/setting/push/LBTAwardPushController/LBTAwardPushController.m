//
//  LBTAwardPushController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTAwardPushController.h"

@interface LBTAwardPushController ()

@end

@implementation LBTAwardPushController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开奖推送设置";
    
    // 1.1.双色球
    LBTSettingSwitchItem *ball = [LBTSettingSwitchItem itemWithTitle:@"双色球"];
    // ball.key = ILSettingAwardPushSSQ;
    
    // 1.2.大乐透
    LBTSettingSwitchItem *letou = [LBTSettingSwitchItem itemWithTitle:@"大乐透"];
    // letou.key = ILSettingAwardPushDLT;
    
    LBTSettingGroup *group = [LBTSettingGroup groupWithItems:@[ball, letou]];
    group.headerTitle = @"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    [self.groupArray addObject:group];
}



@end
