//
//  LBTSettingCell.h
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBTSettingItem;
@interface LBTSettingCell : UITableViewCell
@property (nonatomic, strong) LBTSettingItem *item;
@property (nonatomic, strong) NSIndexPath *indexPath;

+ (instancetype)settingCellWithTableView:(UITableView *)tableView;
@end
