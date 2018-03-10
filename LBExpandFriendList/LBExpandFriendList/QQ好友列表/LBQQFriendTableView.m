//
//  LBQQFriendTableView.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBQQFriendTableView.h"
#define LBCellHeight 44
#import "Masonry.h"
#import "LBQQGroupModel.h"
#import "LBQQFriendCell.h"
#import <objc/runtime.h>
char* const buttonKey = "buttonKey";

#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)
@implementation LBQQFriendTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(void)setDataSourceArray:(NSMutableArray *)dataSourceArray{
    _dataSourceArray = dataSourceArray;
    [self reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSourceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    LBQQGroupModel *groupModel = _dataSourceArray[section];
    NSInteger count = groupModel.isOpened?groupModel.rows.count:0;
    return count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBQQFriendCell *cell = [LBQQFriendCell cellWithTableView:tableView];
    LBQQGroupModel *groupModel = _dataSourceArray[indexPath.section];
    NSDictionary *friendInfoDic = groupModel.rows[indexPath.row];
    cell.titleLabel.text = friendInfoDic[@"name"];
 
    if ([friendInfoDic[@"status"] isEqualToString:@"1"]) {
        cell.onlineLabel.textColor = [UIColor greenColor];
        cell.onlineLabel.text = @"在线";
    }else{
        cell.onlineLabel.textColor = [UIColor lightGrayColor];
        cell.onlineLabel.text = @"不在线";
    }
    cell.nikeLabel.text = friendInfoDic[@"nike"];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{   /// 组头
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    sectionView.backgroundColor = [UIColor whiteColor];
    LBQQGroupModel *groupModel = _dataSourceArray[section];
    /// 添加头按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = sectionView.bounds;
    button.tag = section + 1;
    [button addTarget:self action:@selector(sectionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sectionView addSubview:button];
    /// 线
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, button.frame.size.height-1, button.frame.size.width, 1)];
    [line setImage:[UIImage imageNamed:@"line"]];
    [sectionView addSubview:line];
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (44-16)/2, 14, 16)];
    [sectionView addSubview:imgView];
    if (groupModel.isOpened) {
        
        [imgView setImage:[UIImage imageNamed:@"rightArrow"]];
        
        CGAffineTransform currentTransform = imgView.transform;
        CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, M_PI/2); // 在现在的基础上旋转指定角度
        imgView.transform = newTransform;
        objc_setAssociatedObject(button, buttonKey, imgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }else{
        [imgView setImage:[UIImage imageNamed:@"rightArrow"]];
        objc_setAssociatedObject(button, buttonKey, imgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    /// 添加组标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.text = groupModel.sectionName;
    [button addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@34);
        make.centerY.equalTo(button);
    }];
    /// 折叠状态
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 40, (44 - 20) / 2, 40, 20)];
    [numberLabel setBackgroundColor:[UIColor clearColor]];
    [numberLabel setFont:[UIFont systemFontOfSize:14]];
    NSInteger onLineCount = 0;
    for (NSDictionary *friendInfoDic in groupModel.rows) {
        if ([friendInfoDic[@"status"] isEqualToString:@"1"]) {
            onLineCount++;
        }
    }
    [numberLabel setText:[NSString stringWithFormat:@"%ld/%ld",onLineCount,groupModel.sectionCount]];
    [sectionView addSubview:numberLabel];
    
    return sectionView;
}

- (void)sectionButtonClick:(UIButton *)button
{
    LBQQGroupModel *groupModel = _dataSourceArray[button.tag - 1];
    UIImageView *imageView =  objc_getAssociatedObject(button,buttonKey);
    
    if (groupModel.isOpened) {
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
            CGAffineTransform currentTransform = imageView.transform;
            CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, -M_PI/2);
            // 在现在的基础上旋转指定角度
            imageView.transform = newTransform;
        } completion:nil];
    }else{

        [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionAllowUserInteraction |UIViewAnimationOptionCurveLinear animations:^{
            
            CGAffineTransform currentTransform = imageView.transform;
            CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, M_PI/2);
            // 在现在的基础上旋转指定角度
            imageView.transform = newTransform;
        } completion:nil];
    }
    
    groupModel.isOpened = !groupModel.isOpened;

    [self reloadSections:[NSIndexSet indexSetWithIndex:button.tag - 1] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return LBCellHeight;
}
@end
