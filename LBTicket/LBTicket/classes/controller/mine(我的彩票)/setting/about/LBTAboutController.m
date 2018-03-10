//
//  LBTAboutController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/15.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTAboutController.h"
#import "LBTAboutHeaderView.h"
@interface LBTAboutController ()

@end

@implementation LBTAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"关于";
    
    /// 评分支持
    LBTSettingArrowItem *mark = [LBTSettingArrowItem itemWithTitle:@"评分支持"];
    /// 客服电话
    LBTSettingArrowItem *phone = [LBTSettingArrowItem itemWithTitle:@"客服电话"];
    phone.subtitle = @"020-83568090";
    LBTSettingGroup *group = [LBTSettingGroup groupWithItems:@[mark, phone]];
    [self.groupArray addObject:group];
    /// 设置表格的头部控件
    self.tableView.tableHeaderView = [LBTAboutHeaderView headerView];
    /// self.tableView.scrollEnabled = NO;

}
@end
