//
//  LBQQFriendCell.h
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBQQFriendCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableview;
@property (nonatomic, strong) NSDictionary *datadic;
//@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *onlineLabel;
@property (nonatomic, strong) UILabel *nikeLabel;

@end
