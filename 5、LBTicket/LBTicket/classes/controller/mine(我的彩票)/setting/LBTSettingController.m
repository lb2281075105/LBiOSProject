//
//  LBTSettingController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTSettingController.h"
#import "LBTPushNoticeController.h"
#import "LBTHelpController.h"
#import "LBTProductController.h"
#import "LBTAboutController.h"
#import "LBTShareController.h"
@interface LBTSettingController ()

@end

@implementation LBTSettingController

- (void)viewDidLoad {
    [super viewDidLoad];

    /// 添加第0组
    [self add0SectionItems];
    /// 添加第1组的模型数据
    [self add1SectionItems];
}

/// 添加第0组的模型数据
- (void)add0SectionItems
{
    /// 推送和提醒
    LBTSettingArrowItem *push = [LBTSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒"];
    push.showVCClass = [LBTPushNoticeController class];
    
    /// 摇一摇机选
    LBTSettingSwitchItem *shake = [LBTSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    // shake.key = LBTSettingShakeChoose;
    
    /// 声音效果
    LBTSettingSwitchItem *sound = [LBTSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    // sound.key = LBTSettingSoundEffect;
    
    LBTSettingGroup *group = [LBTSettingGroup groupWithItems:@[push, shake, sound]];
    [self.groupArray addObject:group];
}
/// 添加第1组的模型数据
- (void)add1SectionItems
{
    /// 检查新版本
    LBTSettingArrowItem *update = [LBTSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    update.itemClick = ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"目前已是最新版本了" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    };
    
    /// 帮助
    LBTSettingArrowItem *help = [LBTSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助"];
    help.showVCClass = [LBTHelpController class];
    
    /// 分享
    LBTSettingArrowItem *share = [LBTSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享"];
    share.showVCClass = [LBTShareController class];
    
    /// 查看消息
    LBTSettingArrowItem *msg = [LBTSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息"];
    
    /// 产品推荐
    LBTSettingArrowItem *product = [LBTSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐"];
    product.showVCClass = [LBTProductController class];
    
    /// 关于
    LBTSettingArrowItem *about = [LBTSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于"];
    about.showVCClass = [LBTAboutController class];
    
    LBTSettingGroup *group = [LBTSettingGroup groupWithItems:@[update, help, share, msg, product, about]];
    [self.groupArray addObject:group];
}

@end
