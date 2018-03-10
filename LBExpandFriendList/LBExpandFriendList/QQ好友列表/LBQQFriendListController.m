//
//  LBQQFriendListController.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBQQFriendListController.h"
#import "LBQQFriendTableView.h"
#import "LBQQGroupModel.h"
@interface LBQQFriendListController ()
@property (nonatomic, strong)LBQQFriendTableView *qqFriendTableView;
/// 所有组的数据
@property (nonatomic, strong)NSMutableArray *dataSourceArray;
@end

@implementation LBQQFriendListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"QQ好友列表";
    self.view.backgroundColor = [UIColor whiteColor];
    /// 添加表示图数据
    [self addData];
    /// 添加表示图
    [self addTableView];
}

- (void)addTableView{
    _qqFriendTableView = [[LBQQFriendTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _qqFriendTableView.tableFooterView = [UIView new];
    _qqFriendTableView.dataSourceArray = _dataSourceArray;
    [self.view addSubview:_qqFriendTableView];
}
- (void)addData{
    /// 测试实例
    _dataSourceArray = [[NSMutableArray alloc]init];
    NSArray *dataArray = @[@{@"sectionName":@"特别关心",@"sectionCount":@"3",@"rows":@[
                                               @{@"name":@"Python",@"nike":@"人生苦短，我用Python",@"status":@"1"},
                                               @{@"name":@"Java",@"nike":@"Java大数据时代到来",@"status":@"1"}
                                               ]},
                            @{@"sectionName":@"家乡",@"sectionCount":@"5",@"rows":
                                           @[
                                               @{@"name":@"Swift",@"nike":@"Swift是苹果开发新型开发语言",@"status":@"1"}
                                               ]},
                             @{@"sectionName":@"同学",@"sectionCount":@"3",@"rows":
                                           @[
                                               @{@"name":@"PHP",@"nike":@"PHP是世界上最好的语言",@"status":@"1"}
                                               ]},
                             @{@"sectionName":@"家人",@"sectionCount":@"4",@"rows":
                                           @[
                                               @{@"name":@"GO",@"nike":@"go是Google发行的语言",@"status":@"1"},
                                               @{@"name":@"JS",@"nike":@"JS是脚本语言",@"status":@"1"}]},
                              @{@"sectionName":@"老师",@"sectionCount":@"3",@"rows":
                                           @[
                                               @{@"name":@"运维",@"nike":@"运维是大型公司不可缺少的一部分",@"status":@"1"}
                                               ]},
                              @{@"sectionName":@"朋友",@"sectionCount":@"3",@"rows":
                                           @[
                                               @{@"name":@"自动化测试",@"nike":@"自动化测试需求大",@"status":@"1"},
                                               @{@"name":@"运维",@"nike":@"运维是大型公司不可缺少的一部分",@"status":@"1"}
                                               ]},
                           @{@"sectionName":@"小学",@"sectionCount":@"3",@"rows":
                                 @[@{@"name":@"Python",@"nike":@"人生苦短，我用Python",@"status":@"1"},
                                     @{@"name":@"自动化测试",@"nike":@"自动化测试需求大",@"status":@"1"}
                                     ]},
                           @{@"sectionName":@"初中",@"sectionCount":@"3",@"rows":
                                 @[
                                     @{@"name":@"自动化测试",@"nike":@"自动化测试需求大",@"status":@"1"}
                                     ]},
                           @{@"sectionName":@"高中",@"sectionCount":@"3",@"rows":
                                 @[
                                     @{@"name":@"自动化测试",@"nike":@"自动化测试需求大",@"status":@"1"},
                                     @{@"name":@"JS",@"nike":@"JS是脚本语言",@"status":@"1"}
                                     ]},
                           @{@"sectionName":@"大学",@"sectionCount":@"3",@"rows":
                                 @[
                                     @{@"name":@"自动化测试",@"nike":@"自动化测试需求大",@"status":@"1"},@{@"name":@"GO",@"nike":@"go是Google发行的语言",@"status":@"1"}
                                     ]}
                           
                                     ];
    
    
    for (NSDictionary *dic in dataArray) {
        LBQQGroupModel *model = [[LBQQGroupModel alloc]init];
        model.sectionName = dic[@"sectionName"];
        model.sectionCount = [dic[@"sectionCount"] integerValue];
        model.isOpened = NO;
        model.rows = dic[@"rows"];
        [_dataSourceArray addObject:model];
    }
}
@end
