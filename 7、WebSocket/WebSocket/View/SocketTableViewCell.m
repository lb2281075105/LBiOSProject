//
//  SocketTableViewCell.m
//  WebSocket
//
//  Created by 云媒 on 2017/7/6.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import "SocketTableViewCell.h"
#import "Masonry.h"
#import <UIImageView+WebCache.h>
@implementation SocketTableViewCell
{
    UILabel *_price;
    UILabel *_name;
    UIImageView *_imageView;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpZhi];
    }
    return self;
}
-(void)setModel:(SocketGoodsModel *)model{

    _model = model;
    _name.text = model.name;
    _price.text = model.price;
    [_imageView sd_setImageWithURL:model.small_pic];
}
- (void)setUpZhi{
    // 商品图片
    _imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.height.width.equalTo(@60);
        make.left.equalTo(@15);
    }];
    
    // 商品名称
    _name = [[UILabel alloc]init];
    [self.contentView addSubview:_name];
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageView.mas_right).offset(10);
        make.top.equalTo(_imageView.mas_top);
        make.right.equalTo(self.contentView).offset(-15);
    }];
    
    // 商品价格
    _price = [[UILabel alloc]init];
    [self.contentView addSubview:_price];
    [_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_name);
        make.right.equalTo(self).offset(-40);
        make.height.equalTo(@20);
    }];
}
@end
