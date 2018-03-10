//
//  LBHomeController.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBHomeController.h"
#import "LBHomeTableView.h"
@interface LBHomeController ()
/// 数据
@property (nonatomic, strong)NSArray *dataSourceArray;
@property (nonatomic, strong)LBHomeTableView *lbhomeTableView;
@end

@implementation LBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSourceArray = @[@"可折叠的表示图",@"QQ好友列表"];
    self.title = @"TableView折叠";
    /// 添加表示图
    [self addTableView];
}
-(void)addTableView{
    _lbhomeTableView = [[LBHomeTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _lbhomeTableView.tableFooterView = [UIView new];
    _lbhomeTableView.dataSourceArray = _dataSourceArray;
    _lbhomeTableView.rowHeight = 50;
    [self.view addSubview:_lbhomeTableView];
}



@end
