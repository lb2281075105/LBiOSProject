//
//  LBTTableController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTHallTableController.h"

@interface LBTHallTableController ()

@end

@implementation LBTHallTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"LBTTableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"LBTTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"text-%ld", indexPath.row];
    return cell;
}
@end
