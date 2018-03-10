//
//  LBHomeTableView.m
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import "LBHomeTableView.h"
#import "LBHomeCell.h"
#import "UIView+ViewController.h"
#import "LBExpandController.h"
#import "LBQQFriendListController.h"
@implementation LBHomeTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
-(void)setDataSourceArray:(NSArray *)dataSourceArray{
    _dataSourceArray = dataSourceArray;
    [self reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSourceArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBHomeCell *cell = [LBHomeCell cellWithTableView:tableView];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",_dataSourceArray[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        [self.viewController.navigationController pushViewController:[[LBExpandController alloc]init] animated:YES];
    }else{
        [self.viewController.navigationController pushViewController:[[LBQQFriendListController alloc]init] animated:YES];
    }
    
    
}
@end
