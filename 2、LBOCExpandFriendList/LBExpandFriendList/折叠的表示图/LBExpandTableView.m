//
//  LBExpandTableView.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBExpandTableView.h"
#import "LBExpandCell.h"
#import "UIColor+colorWithHex.h"
#define LBCellHeight 44
@implementation LBExpandTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
-(void)setSectionTitleArray:(NSMutableArray *)sectionTitleArray{
    _sectionTitleArray = sectionTitleArray;
    [self reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSourceArray.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sectionTitleArray[section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBExpandCell *cell = [LBExpandCell cellWithTableView:tableView];
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld组 %@",(long)indexPath.section,_dataSourceArray[indexPath.section][indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([_sectionStateArray[section] isEqualToString:@"1"]){
        /// 组展开状态
        NSArray *array = [_dataSourceArray objectAtIndex:section];
        return array.count;
    }else{
        /// 组闭合状态,返回0
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{   /// 添加按钮到组头视图
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, self.frame.size.width, LBCellHeight)];
    button.tag = section + 1;
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 60)];
    [button addTarget:self action:@selector(sectionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    /// 添加底部线
    UIImageView *line = [[UIImageView alloc]init];
    [line setImage:[UIImage imageNamed:@"line"]];
    [button addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button);
        make.top.equalTo(button.mas_top).offset(LBCellHeight - 1);
        make.centerY.equalTo(button);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@1);
    }];
    /// 添加左边图标
    UIImageView *leftImgView = [[UIImageView alloc]init];
    [leftImgView setImage:[UIImage imageNamed:@"circle"]];
    [button addSubview:leftImgView];
    [leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@24);
        make.left.equalTo(button).offset(10);
        make.centerY.equalTo(button);
    }];
    /// 添加右边的箭头
    UIImageView *arrowImgView = [[UIImageView alloc]init];
    [button addSubview:arrowImgView];
    [arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@10);
        make.centerY.equalTo(button);
        make.left.equalTo(button.mas_left).offset([UIScreen mainScreen].bounds.size.width - 30);
    }];
    if ([_sectionStateArray[section] isEqualToString:@"0"]) {
        arrowImgView.image = [UIImage imageNamed:@"bottomArrow"];
    }else if ([_sectionStateArray[section] isEqualToString:@"1"]) {
        arrowImgView.image = [UIImage imageNamed:@"topArrow"];
    }
    /// 每组个数
    UILabel *countLabel = [[UILabel alloc]init];
    [countLabel setBackgroundColor:[UIColor clearColor]];
    countLabel.font = [UIFont systemFontOfSize:14];
    countLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)[_dataSourceArray[section] count]];
    [button addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(button);
        make.right.equalTo(arrowImgView.mas_left).offset(- 20);
    }];
    /// 组标题
    UILabel *sectionTitleLabel = [[UILabel alloc]init];
    [sectionTitleLabel setBackgroundColor:[UIColor clearColor]];
    sectionTitleLabel.font = [UIFont systemFontOfSize:14];
    sectionTitleLabel.text = _sectionTitleArray[section];
    [button addSubview:sectionTitleLabel];
    [sectionTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(button);
        make.left.equalTo(leftImgView.mas_right).offset(15);
    }];
    return button;
}
- (void)sectionButtonClick:(UIButton *)button
{
    /// 判断点击组被点击的状态值
    if ([_sectionStateArray[button.tag - 1] isEqualToString:@"1"]){
        /// 修改点击的状态值
        [_sectionStateArray replaceObjectAtIndex:button.tag - 1 withObject:@"0"];
    }else{
        [_sectionStateArray replaceObjectAtIndex:button.tag - 1 withObject:@"1"];
    }
    /// 刷新组
    [self reloadSections:[NSIndexSet indexSetWithIndex:button.tag - 1] withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return LBCellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return LBCellHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
