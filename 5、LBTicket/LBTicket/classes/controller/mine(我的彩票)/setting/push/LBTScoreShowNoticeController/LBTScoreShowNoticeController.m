//
//  LBTScoreShowNoticeController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTScoreShowNoticeController.h"

@interface LBTScoreShowNoticeController ()

@property (nonatomic, strong) LBTSettingLabelItem *startTime;
@end

@implementation LBTScoreShowNoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"比分直播设置";
    /// 提醒我关注的比赛
    [self addNoticeGroup];
    
    /// 起始时间
    [self addStartTimeGroup];
    
    /// 结束时间
    [self addEndTimeGroup];
}

/// 起始时间
- (void)addStartTimeGroup
{
    LBTSettingLabelItem *startTime = [LBTSettingLabelItem itemWithTitle:@"起始时间"];
    // startTime.key = ILSettingScoreShowStartTime;
    if (startTime.text.length == 0) {
        startTime.text = @"00:00";
    }
    
    //    __unsafe_unretained  和 __weak 是等价的
    __weak typeof(startTime) weakStartTime = startTime;
    __weak typeof(self) weakSelf = self;
    startTime.itemClick = ^{
        // 2.0.默认时间
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"HH:mm";
        NSDate *date = [fmt dateFromString:weakStartTime.text];
        
        // 2.1.键盘
        UIDatePicker *dp = [[UIDatePicker alloc] init];
        dp.date = date;
        dp.datePickerMode = UIDatePickerModeTime;
        [dp addTarget:weakSelf action:@selector(startTimeChange:) forControlEvents:UIControlEventValueChanged];
        dp.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        dp.backgroundColor = [UIColor lightGrayColor];
        
        // 2.2.文本框
        UITextField *temp = [[UITextField alloc] init];
        temp.inputView = dp;
        
        // 2.3.添加temp
        [weakSelf.view addSubview:temp];
        
        // 2.4.叫出键盘
        [temp becomeFirstResponder];
    };
    _startTime = startTime;
    
    LBTSettingGroup *startTimeGroup = [[LBTSettingGroup alloc] init];
    startTimeGroup.items = @[startTime];
    startTimeGroup.headerTitle = @"只在以下时间接受比分直播";
    [self.groupArray addObject:startTimeGroup];
}

/// 结束时间
- (void)addEndTimeGroup
{
    LBTSettingLabelItem *endTime = [LBTSettingLabelItem itemWithTitle:@"结束时间"];
    //    endTime.text = @"23:59";
    // endTime.key = ILSettingScoreShowEndTime;
    if (endTime.text.length == 0) {
        endTime.text = @"23:59";
    }
    LBTSettingGroup *endTimeGroup = [[LBTSettingGroup alloc] init];
    endTimeGroup.items = @[endTime];
    [self.groupArray addObject:endTimeGroup];
}

/// 提醒我关注的比赛
- (void)addNoticeGroup
{
    LBTSettingSwitchItem *notice = [LBTSettingSwitchItem itemWithTitle:@"提醒我关注的比赛"];
    // notice.key = ILSettingScoreShowNoticeCareGame;
    LBTSettingGroup *noticeGroup = [[LBTSettingGroup alloc] init];
    noticeGroup.items = @[notice];
    noticeGroup.footerTitle = @"当我关注的比赛比分发生变化时，通过小弹窗或推送进行提醒";
    [self.groupArray addObject:noticeGroup];
}

/// 开始时间更改了
- (void)startTimeChange:(UIDatePicker *)dp
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    
    // 修改模型
    _startTime.text = [fmt stringFromDate:dp.date];
    
    // 刷新表格
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationNone];
}
@end
