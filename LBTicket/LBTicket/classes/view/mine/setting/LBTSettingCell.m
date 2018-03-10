//
//  LBTSettingCell.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTSettingCell.h"
#import "LBTSettingItem.h"
#import "LBTSettingSwitchItem.h"
#import "LBTSettingArrowItem.h"
#import "LBTSettingLabelItem.h"
@interface LBTSettingCell()

/// 箭头视图
@property (nonatomic, strong) UIImageView *arrowImageView;
/// 开关
@property (nonatomic, strong) UISwitch *_switch;
/// 右边的text
@property (nonatomic, strong) UILabel *label;
/// 分割线
@property (nonatomic, strong) UIView *dividerView;
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation LBTSettingCell
/// 懒加载
//-(UIImageView *)arrowImageView{
//
//    if (_arrowImageView == nil) {
//        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
////        _arrowImageView.frame = CGRectMake(0, 0, 40, 30);
//    }
//    return _arrowImageView;
//}
/// 开关
//-(UISwitch *)_switch{
//
//    if (__switch == nil) {
//        __switch = [[UISwitch alloc] init];
//        [__switch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
//    }
//    return __switch;
//}
/// 右边的文本
//-(UILabel *)label{
//
//    if (_label == nil) {
//        _label = [[UILabel alloc] init];
//        _label.bounds = CGRectMake(0, 0, 100, self.frame.size.height);
//        _label.textAlignment = NSTextAlignmentRight;
//        _label.backgroundColor = [UIColor clearColor];
//        _label.textColor = LBTColor(173, 69, 14);
//        _label.font = [UIFont systemFontOfSize:13];
//        _label.text = @"00:00";
//    }
//    return _label;
//}
/// 分割线
-(UIView *)dividerView{

    if (_dividerView == nil) {
        _dividerView = [[UIView alloc] initWithFrame:CGRectMake(self.textLabel.frame.origin.x, 0, self.contentView.frame.size.width + 100, 1.2)];
        _dividerView.backgroundColor = LBTColor(225, 225, 225);
        [self.contentView addSubview:_dividerView];
    }
    return _dividerView;
}
+ (instancetype)settingCellWithTableView:(UITableView *)tableView
{
    /// 用static修饰的局部变量，只会初始化一次
    static NSString *ID = @"Cell";
    
    /// 拿到一个标识先去缓存池中查找对应的Cell
    LBTSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    /// 如果缓存池中没有，才需要传入一个标识创建新的Cell
    if (cell == nil) {
        cell = [[LBTSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.tableView = tableView;
    }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /// 设置背景
        [self setupBg];
        
        /// 设置子控件属性
        [self setupSubviews];
        
        /// 添加分隔线
        /// [self dividerView];
    }
    return self;
}
/// 设置背景
- (void)setupBg
{
    /// 默认
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bg;
    
    /// 选中
    UIView *selectedBg = [[UIView alloc] init];
    selectedBg.backgroundColor = LBTColor(237, 233, 218);
    self.selectedBackgroundView = selectedBg;
}
/// 设置子控件属性
- (void)setupSubviews
{
    // 文字颜色
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];

    // 文字大小
    self.textLabel.font = [UIFont systemFontOfSize:15];
    self.detailTextLabel.font = [UIFont systemFontOfSize:13];
    self.detailTextLabel.textColor = [UIColor darkGrayColor];
}

/// 分割线
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    self.dividerView.hidden = indexPath.row == 0;
}
- (void)setItem:(LBTSettingItem *)item
{
    _item = item;
    /// 设置数据
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subtitle;
    
    if ([item isKindOfClass:[LBTSettingArrowItem class]]) {

        [self settingArrow];
    } else if ([item isKindOfClass:[LBTSettingSwitchItem class]]) {
      
        [self settingSwitch];
    } else if ([item isKindOfClass:[LBTSettingLabelItem class]]) {

        [self settingLabel];
    } else {
        /// 什么也没有，清空右边显示的view
        self.accessoryView = nil;
        /// 用默认的选中样式
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}
/// 设置item右边的箭头
- (void)settingArrow
{
    if (_arrowImageView == nil) {
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    /// 右边显示箭头
    self.accessoryView = _arrowImageView;
    /// 用默认的选中样式
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}
/// 设置右边的开关
- (void)settingSwitch
{
    if (__switch == nil) {
        __switch = [[UISwitch alloc] init];
        [__switch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    LBTSettingSwitchItem *switchItem = (LBTSettingSwitchItem *)_item;
    __switch.on = !switchItem.isOff;
    
    // 右边显示开关
    self.accessoryView = __switch;
    // 禁止选中
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
/// 开关点击
- (void)switchChange
{
    LBTSettingSwitchItem *switchItem = (LBTSettingSwitchItem *)_item;
    switchItem.off = !__switch.isOn;
}
/// 设置右边的文本标签
- (void)settingLabel
{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.bounds = CGRectMake(0, 0, 100, self.frame.size.height);
        _label.textAlignment = NSTextAlignmentRight;
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = LBTColor(173, 69, 14);
        _label.font = [UIFont systemFontOfSize:13];
        _label.text = @"00:00";
    }
    /// 右边显示标签
    self.accessoryView = _label;
    /// 用默认的选中样式
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    /// mark -- 更新分割线的长度
    _dividerView.frame = CGRectMake(self.textLabel.frame.origin.x, 0, self.contentView.frame.size.width + 100, 1.2);
    
    /// 右边控件的frame
    CGRect accessF = self.accessoryView.frame;
    accessF.origin.x = self.frame.size.width - accessF.size.width - 10 * 2;
    self.accessoryView.frame = accessF;
}
//- (void)setFrame:(CGRect)frame
//{
//    float value = [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0;
//    if (!value) {
//        frame.origin.x = - 10;
//        frame.size.width = [UIScreen mainScreen].bounds.size.width + 10 * 2;
//    }
//    [super setFrame:frame];
//}
//-(void)setSelected:(BOOL)selected{
//    [super setSelected:selected];
//}
@end
