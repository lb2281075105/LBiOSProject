//
//  LBZFBController.m
//  LBZhiFuBao
//
//  Created by 刘博 on 2017/8/11.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBZFBController.h"
#import "LBZFBTableView.h"
#import "LBZFBModel.h"
@interface LBZFBController ()
@property (nonatomic, strong) LBZFBTableView *lbzfbTableView;
@end

@implementation LBZFBController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    /// 创建表
    [self setUpTableView];
    /// 加载数据
    [self addData];
}

- (void)setUpTableView{

    _lbzfbTableView = [[LBZFBTableView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height) style:UITableViewStylePlain];
    
    [self.view addSubview:_lbzfbTableView];
}

- (void)addData{

    NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"dataList.plist" withExtension:nil ];
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    /// array = dataArray.copy; copy 把一个可变的copy成不可变
    for (NSDictionary *dic in array) {
        //LBZFBModel *model = [LBZFBModel mj_objectWithKeyValues:dic];
        LBZFBModel *model = [LBZFBModel modelWithDict:dic];
        [dataArray addObject:model];
    }
    _lbzfbTableView.dataArray = dataArray;
}
@end
