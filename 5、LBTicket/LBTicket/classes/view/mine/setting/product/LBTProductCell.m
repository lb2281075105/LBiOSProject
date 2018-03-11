//
//  LBTProductCell.m
//  LBTicket
//
//  Created by yunmei on 2017/9/15.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTProductCell.h"
#import "LBTProduct.h"
// 类扩展
@interface LBTProductCell()
@property (strong, nonatomic) UIImageView *iconView;
@property (strong, nonatomic) UILabel *titleView;
@end
@implementation LBTProductCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /// 加载子控件
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews{
    /// 图标
    _iconView = [[UIImageView alloc]init];
    _iconView.layer.cornerRadius = 8;
    /// 让内部的所有图层都遵循父图层的边框来显示
    /// 超出父图层边框的内容全部不显示（裁剪掉）
    _iconView.layer.masksToBounds = YES;
    [self.contentView addSubview:_iconView];
    __weak typeof(self.contentView) weakSelf = self.contentView;
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@60);
        make.centerX.equalTo(weakSelf);
        make.top.equalTo(@0);
    }];
    /// 标题
    _titleView = [[UILabel alloc]init];
    _titleView.textAlignment = NSTextAlignmentCenter;
    _titleView.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_titleView];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@15);
    }];
    
}
- (void)setProduct:(LBTProduct *)product
{
    _product = product;
    if ([product.icon containsString:@"@2x"]) {
       product.icon = [product.icon stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
    }
    /// 图标
    _iconView.image = [UIImage imageNamed:product.icon];
    LBTLog(@"%@",product.icon);
    /// 标题
    _titleView.text = product.title;
}
@end
