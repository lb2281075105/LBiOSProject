//
//  LBHomeController.m
//  LBWeChat
//
//  Created by liubo on 2018/3/12.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "LBHomeController.h"

@interface LBHomeController (){
    UISearchBar *_searchBar;
}
@property(nonatomic,retain)NSMutableArray *searchReslutArray;

@end

@implementation LBHomeController

-(NSMutableArray *)searchReslutArray{
    if (_searchReslutArray == nil) {
        _searchReslutArray = [NSMutableArray array];
    }
    return _searchReslutArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSearchBar];
    [self setUpData];
    [self setUpTableView];
}
- (void)setUpTableView{
    [self registerCellWithClass:@"UITableViewCell" tableView:self.tableView];
    self.tableView.frame = CGRectMake(0, kNavbarHeight, kScreenWidth, kScreenHeight-kNavbarHeight);
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = _searchBar;
}
- (void)setUpData{
    [self.dataSource addObject:@"1"];
    [self.dataSource addObject:@"2"];
    [self.dataSource addObject:@"3"];
    [self.dataSource addObject:@"4"];
    [self.dataSource addObject:@"5"];
    [self.dataSource addObject:@"6"];
    [self.dataSource addObject:@"7"];
    [self.dataSource addObject:@"8"];
    [self.dataSource addObject:@"9"];
    [self.dataSource addObject:@"10"];
    [self.dataSource addObject:@"11"];
    [self.dataSource addObject:@"12"];
}
- (void)setUpSearchBar{
    _searchBar  = [[UISearchBar alloc]initWithFrame:CGRectMake(0, kNavbarHeight, kScreenWidth, 44)];
    _searchBar.placeholder = @"搜索";
    _searchBar.tintColor = kThemeColor;
    _searchBar.delegate = self;
    _searchBar.barStyle = UIBarStyleDefault;
    _searchBar.translucent = YES;
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES];
    [self.searchReslutArray removeAllObjects];
    [self.view endEditing:YES];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
    [self.searchReslutArray removeAllObjects];
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    [self.tableView reloadData];
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;{
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    [self.searchReslutArray removeAllObjects];
    for(NSString *aString in self.dataSource){
        // self.dataSource 里面包含aString
        NSRange range = [aString rangeOfString:searchBar.text];
        if (range.location != NSNotFound) {
            [self.searchReslutArray addObject:aString];
        }
    }
    
    [self.tableView reloadData];
}
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return YES;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if([_searchBar.text isEqualToString:@""]){
        return self.dataSource.count;
    }else{
        return self.searchReslutArray.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    if([_searchBar.text isEqualToString:@""]){
        cell.textLabel.text = self.dataSource[indexPath.row];
    }else{
        cell.textLabel.text = self.searchReslutArray[indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
    NSString *stringStr = @"";
    if([_searchBar.text isEqualToString:@""]){
        stringStr = self.dataSource[indexPath.row];
    }else{
        stringStr  = self.searchReslutArray[indexPath.row];
    }
    NSLog(@"%@",stringStr);
}
@end
