//
//  LBTBaseSettingController.h
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBTSettingGroup.h"
#import "LBTSettingItem.h"
#import "LBTSettingArrowItem.h"
#import "LBTSettingLabelItem.h"
#import "LBTSettingValueItem.h"
#import "LBTSettingSwitchItem.h"
#import "LBTSettingCell.h"
#import "LBTSettingKeys.h"
@interface LBTBaseSettingController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
/// 所有的组模型
@property (nonatomic, strong) NSMutableArray *groupArray;
@end
