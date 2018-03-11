//
//  LBTBaseSettingController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTBaseSettingController.h"

@interface LBTBaseSettingController ()

@end

@implementation LBTBaseSettingController
/// 加载视图
- (void)loadView{
    
}
/// 懒加载
- (NSMutableArray *)groupArray{

    if (_groupArray == nil) {
        _groupArray = [[NSMutableArray alloc]init];
    }
    return _groupArray;
}
- (UITableView *)tableView{

    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        /// mark -- 添加表视图到视图上面
        self.view = _tableView;
        /// 下面的代码错误
        /// [self.view addSubview:_tableView];
        /// 背景
        _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
        /// 分隔线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionFooterHeight = 0;
        _tableView.sectionHeaderHeight = 18;
        if ([[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0) {
            /// 设置表视图的frame
            _tableView.contentInset = UIEdgeInsetsMake(-17, 0, 0, 0);
        }
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    LBTSettingGroup *group = _groupArray[section];
    return group.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建LBTSettingCell
    LBTSettingCell *cell = [LBTSettingCell settingCellWithTableView:tableView];
    
    // 取出这行对应的模型（LBTSettingItem）
    LBTSettingGroup *group = _groupArray[indexPath.section];
    cell.item = group.items[indexPath.row];
    cell.indexPath = indexPath;
    return cell;
}
/// 返回每一组的header标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    LBTSettingGroup *group = _groupArray[section];
    return group.headerTitle;
}
/// 返回每一组的footer标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    LBTSettingGroup *group = _groupArray[section];
    return group.footerTitle;
}
/// 点击了cell后的操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /// 去除选中时的背景
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /// 取出这行对应的模型
    LBTSettingGroup *group = _groupArray[indexPath.section];
    LBTSettingItem *item = group.items[indexPath.row];
    
    /// 取出这行对应模型中的block代码
    if (item.itemClick) {
        // 执行block
        item.itemClick();
        return;
    }
    
    /// 检测有没有要跳转的控制器
    if ([item isKindOfClass:[LBTSettingArrowItem class]]) {
        LBTSettingArrowItem *arrowItem = (LBTSettingArrowItem *)item;
        if (arrowItem.showVCClass) {
            UIViewController *vc = [[arrowItem.showVCClass alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

@end
