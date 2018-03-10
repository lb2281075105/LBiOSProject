//
//  LBZFBTableCell.m
//  LBZhiFuBao
//
//  Created by 刘博 on 2017/8/11.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBZFBTableCell.h"
#import "Masonry.h"
#import "LBZFBModel.h"
@implementation LBZFBTableCell{
    /// 头像
    UIImageView *_touxiang;
    /// 名称
    UILabel *_name;
    /// 图片
    UIImageView *_icon;
    /// 时间
    UILabel *_time;
    /// 内容
    UILabel *_content;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{

    LBZFBTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LBZFBTableCell"];
    if (!cell) {
        cell = [[LBZFBTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LBZFBTableCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setModel:(LBZFBModel *)model{

    _model = model;
    _name.text = model.name;
    _time.text = model.time;
    _content.text = model.content;

    if (![model.icon isEqualToString:@""]) {
        UIImage *image = [UIImage imageNamed:model.icon];
        CGFloat width = 150 / image.size.height * image.size.width;
        _icon.image = image;
        [_icon mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
        }];
    }else{
        _icon.image = nil;
        [_time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_icon.mas_bottom);
        }];
    }
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI{

    /// 头像
    _touxiang =[[UIImageView alloc]init];
    _touxiang.image = [UIImage imageNamed:@"Image-7"];
    [self.contentView addSubview:_touxiang];
    [_touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@8);
        make.width.height.equalTo(@40);
    }];
    /// 名称 0x3a5e8d
    _name =[[UILabel alloc]init];
    /// _name.text = @"张三";
    [self.contentView addSubview:_name];
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_touxiang);
        make.left.equalTo(_touxiang.mas_right).offset(8);
    }];
    
    /// 内容 0x444
    _content =[[UILabel alloc]init];
    _content.numberOfLines = 0;
    /// _content.text = @"我的世界我的世界我的世界我的世界我的世界我的世界我的世界我的世界我的世界我的世界我的世界我的世界";
    [self.contentView addSubview:_content];
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name);
        make.top.equalTo(_name.mas_bottom).offset(8);
        make.right.equalTo(self).offset(-8);
    }];
    
    /// 图片
    _icon =[[UIImageView alloc]init];
    /// _icon.image = [UIImage imageNamed:@"Image-6"];
    [self.contentView addSubview:_icon];
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name);
        make.top.equalTo(_content.mas_bottom).offset(8);
        make.height.mas_lessThanOrEqualTo(150); /// 小于等于
//        make.width.offset(200);
    }];
    /// 时间
    _time =[[UILabel alloc]init];
    /// _time.text = @"今天";
    [self.contentView addSubview:_time];
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name);
        make.top.equalTo(_icon.mas_bottom).offset(8);
    }];
    
    /// 删除
    UILabel *delete = [[UILabel alloc]init];
    delete.text = @"删除";
    delete.textColor = [UIColor redColor];
    [self.contentView addSubview:delete];
    [delete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_time.mas_right).offset(8);
        make.baseline.equalTo(_time);  /// 基线
    }];
    /// 第二步：重点
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
        make.bottom.equalTo(delete.mas_bottom).offset(8);
    }];
    /// 添加更多按钮
    //    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [moreButton setTitle:@"更多" forState:(UIControlStateNormal)];
    //    [moreButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //    [self.contentView addSubview:moreButton];
    //    [moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.right.offset(-8);
    //        make.top.equalTo(delete);
    //    }];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
/// 布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
