//
//  LBExpandCell.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBExpandCell.h"

@implementation LBExpandCell

+ (instancetype)cellWithTableView:(UITableView *)tableview{
    
    LBExpandCell *cell = [tableview dequeueReusableCellWithIdentifier:@"LBExpandCell"];
    if (!cell) {
        cell = [[LBExpandCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LBExpandCell"];
    }
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    /// 图标
    _imageView = [[UIImageView alloc]init];
    _imageView.image = [UIImage imageNamed:@"rightArrow"];
    [self.contentView addSubview:_imageView];
    __weak typeof(self.contentView) weakSelf = self.contentView;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(33);
        make.width.height.equalTo(@10);
    }];
    /// 标题
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.mas_equalTo(_imageView.mas_right).offset(25);
    }];
}
@end
