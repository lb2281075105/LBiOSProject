//
//  LBHomeCell.h
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBHomeCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableview;
@property (nonatomic, strong) UILabel *titleLabel;
@end
