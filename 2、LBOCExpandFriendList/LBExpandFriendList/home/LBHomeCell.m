//
//  LBHomeCell.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBHomeCell.h"
#import "Masonry.h"
@implementation LBHomeCell{
    UIView *_downLine;
}

+ (instancetype)cellWithTableView:(UITableView *)tableview{
    
    LBHomeCell *cell = [tableview dequeueReusableCellWithIdentifier:@"LBHomeCell"];
    if (!cell) {
        cell = [[LBHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LBHomeCell"];
    }
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)awakeFromNib{
    [super awakeFromNib];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUpLayout];
    }
    return  self;
}
- (void)setUpLayout{
    /// 标题
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_titleLabel];
    __weak typeof(self.contentView) weakSelf = self.contentView;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf);
    }];
    /// 底部的线
    _downLine = [[UIView alloc]init];
    _downLine.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_downLine];
    [_downLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
        make.height.equalTo(@1);
        make.left.right.equalTo(weakSelf);
    }];
}

@end
