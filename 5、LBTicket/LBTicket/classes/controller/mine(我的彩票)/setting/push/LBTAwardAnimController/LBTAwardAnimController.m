//
//  LBTAwardAnimController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTAwardAnimController.h"

@interface LBTAwardAnimController ()

@end

@implementation LBTAwardAnimController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"中奖动画";
    
    LBTSettingSwitchItem *anim = [LBTSettingSwitchItem itemWithTitle:self.title];
    // anim.key = ILSettingAwardAnim;
    
    LBTSettingGroup *group = [LBTSettingGroup groupWithItems:@[anim]];
    group.headerTitle = @"当您有新中奖订单，启动程序时通过动画提醒您。为避免过于频繁，高频彩不会提醒。";
    [self.groupArray addObject:group];
}



@end
