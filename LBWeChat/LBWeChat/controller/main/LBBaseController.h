//
//  LBBaseController.h
//  LBWeChat
//
//  Created by liubo on 2018/3/12.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBBaseController : UIViewController

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;

-(void)registerCellWithNib:(NSString *)nibName tableView:(UITableView *)tableView;
-(void)registerCellWithClass:(NSString *)className tableView:(UITableView *)tableView;
-(int)getRandomNumber:(int)from to:(int)to;
@end
