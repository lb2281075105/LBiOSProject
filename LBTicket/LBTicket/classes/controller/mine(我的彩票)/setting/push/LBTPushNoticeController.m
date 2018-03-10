//
//  LBTPushNoticeController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTPushNoticeController.h"
#import "LBTAwardAnimController.h"
#import "LBTAwardPushController.h"
#import "LBTBuyTimedNoticeController.h"
#import "LBTScoreShowNoticeController.h"
@interface LBTPushNoticeController ()

@end

@implementation LBTPushNoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推送和提醒";
    
    // 1.1 开奖号码推送
    LBTSettingArrowItem *push = [LBTSettingArrowItem itemWithTitle:@"开奖号码推送"];
    push.showVCClass = [LBTAwardPushController class];
    
    // 1.2 中奖动画
    LBTSettingArrowItem *anim = [LBTSettingArrowItem itemWithTitle:@"中奖动画"];
    anim.showVCClass = [LBTAwardAnimController class];
    
    // 1.3 比分直播提醒
    LBTSettingArrowItem *score = [LBTSettingArrowItem itemWithTitle:@"比分直播提醒"];
    score.showVCClass = [LBTScoreShowNoticeController class];
    
    // 1.4 购彩定时提醒
    LBTSettingArrowItem *time = [LBTSettingArrowItem itemWithTitle:@"购彩定时提醒"];
    time.showVCClass = [LBTBuyTimedNoticeController class];
    
    LBTSettingGroup *group = [LBTSettingGroup groupWithItems:@[push, anim, score, time]];
    [self.groupArray addObject:group];

}



@end
