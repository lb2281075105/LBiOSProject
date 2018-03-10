//
//  LBQQFriendCell.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBQQFriendCell.h"
#import "Masonry.h"
@implementation LBQQFriendCell{
    UIImageView *_imageView;
}
+ (instancetype)cellWithTableView:(UITableView *)tableview{
    
    LBQQFriendCell *cell = [tableview dequeueReusableCellWithIdentifier:@"LBQQFriendCell"];
    if (!cell) {
        cell = [[LBQQFriendCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LBQQFriendCell"];
    }
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)setDatadic:(NSDictionary *)datadic{
    _datadic = datadic;
    _titleLabel.text = _datadic[@"name"];
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
    _imageView.image = [UIImage imageNamed:@"icon.jpg"];
    _imageView.layer.cornerRadius = 25;
    _imageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_imageView];
    __weak typeof(self.contentView) weakSelf = self.contentView;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(25);
        make.width.height.equalTo(@50);
    }];
    /// 标题
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(8);
        make.left.mas_equalTo(_imageView.mas_right).offset(10);
    }];
    /// 在线状态
    _onlineLabel = [[UILabel alloc]init];
    _onlineLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_onlineLabel];
    [_onlineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_imageView.mas_bottom);
        make.left.mas_equalTo(_imageView.mas_right).offset(10);
    }];
    /// 昵称
    _nikeLabel = [[UILabel alloc]init];
    _nikeLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_nikeLabel];
    [_nikeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_imageView.mas_bottom);
        make.left.mas_equalTo(_onlineLabel.mas_right).offset(10);
    }];
}

@end
