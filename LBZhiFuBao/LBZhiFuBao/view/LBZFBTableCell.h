//
//  LBZFBTableCell.h
//  LBZhiFuBao
//
//  Created by 刘博 on 2017/8/11.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBZFBModel;
@interface LBZFBTableCell : UITableViewCell
@property (nonatomic, strong) LBZFBModel *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
