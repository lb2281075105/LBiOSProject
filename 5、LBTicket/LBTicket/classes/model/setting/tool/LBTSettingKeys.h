//
//  LBTSettingKeys.h
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#define LBTDeclareConstStr(name) \
extern NSString *const name;

// 摇一摇机选
LBTDeclareConstStr(LBTSettingShakeChoose)
// 声音效果
LBTDeclareConstStr(LBTSettingSoundEffect)

// 开奖推送设置
// 双色球
LBTDeclareConstStr(LBTSettingAwardPushSSQ)
// 大乐透
LBTDeclareConstStr(LBTSettingAwardPushDLT)

// 中奖动画
LBTDeclareConstStr(LBTSettingAwardAnim)

// 比分直播
// 提醒关注的比赛
LBTDeclareConstStr(LBTSettingScoreShowNoticeCareGame)
// 起始时间
LBTDeclareConstStr(LBTSettingScoreShowStartTime)
// 结束时间
LBTDeclareConstStr(LBTSettingScoreShowEndTime)

// 购彩定时提醒
LBTDeclareConstStr(LBTSettingBuyTimedNotice)
