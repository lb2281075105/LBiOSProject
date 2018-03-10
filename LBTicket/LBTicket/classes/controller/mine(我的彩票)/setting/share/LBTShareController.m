//
//  LBTShareController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/15.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTShareController.h"

@interface LBTShareController ()

@end

@implementation LBTShareController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分享设置";
    
    /// 新浪微博
    LBTSettingArrowItem *weibo = [LBTSettingArrowItem itemWithIcon:@"WeiboSina" title:@"新浪微博"];
    /// 短信分享
    LBTSettingArrowItem *sms = [LBTSettingArrowItem itemWithIcon:@"SmsShare" title:@"短信分享"];
    /// 邮件分享
    LBTSettingArrowItem *mail = [LBTSettingArrowItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    
    LBTSettingGroup *group = [LBTSettingGroup groupWithItems:@[weibo, sms, mail]];
    [self.groupArray addObject:group];
}



@end
