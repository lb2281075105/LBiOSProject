//
//  SocketTableView.m
//  WebSocket
//
//  Created by 云媒 on 2017/7/6.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import "SocketTableView.h"
#import "SocketTableViewCell.h"
#import "SocketModel.h"
@implementation SocketTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource= self;
    }
    return self;
}
-(void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
    [self reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_dataArray[section] goods] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    SocketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[SocketTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.model = [_dataArray[indexPath.section] goods][indexPath.row];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 120)];
    
    UILabel *shopLabel = [[UILabel alloc]init];
    shopLabel.frame = CGRectMake(0, 0, 200, 30);
    shopLabel.text = [_dataArray[section] shopname];
    [headerView addSubview:shopLabel];
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.frame = CGRectMake(0, 30, 200, 30);
    priceLabel.text = [_dataArray[section] total_amount];
    [headerView addSubview:priceLabel];
    
    UILabel *addressLabel = [[UILabel alloc]init];
    addressLabel.frame = CGRectMake(0, 60, 200, 30);
    addressLabel.text = [_dataArray[section] address];
    [headerView addSubview:addressLabel];
    
    UILabel *shangpinLabel = [[UILabel alloc]init];
    shangpinLabel.frame = CGRectMake(0, 90, 200, 30);
    shangpinLabel.text = @"商品";
    [headerView addSubview:addressLabel];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 120;
}
@end
