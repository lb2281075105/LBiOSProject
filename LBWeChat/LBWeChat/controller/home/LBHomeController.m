//
//  LBHomeController.m
//  LBWeChat
//
//  Created by liubo on 2018/3/12.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "LBHomeController.h"

@interface LBHomeController ()<UISearchBarDelegate>{
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
    [self.dataSource addObject:@"a"];
    [self.dataSource addObject:@"b"];
    [self.dataSource addObject:@"c"];
    [self.dataSource addObject:@"d"];
    [self.dataSource addObject:@"e"];
    [self.dataSource addObject:@"f"];
    [self.dataSource addObject:@"g"];
    [self.dataSource addObject:@"h"];
    [self.dataSource addObject:@"i"];
    [self.dataSource addObject:@"j"];
    [self.dataSource addObject:@"k"];
    [self.dataSource addObject:@"l"];
    [self.dataSource addObject:@"m"];
    [self.dataSource addObject:@"m"];
    [self.dataSource addObject:@"n"];
    [self.dataSource addObject:@"o"];
    [self.dataSource addObject:@"p"];
    [self.dataSource addObject:@"q"];

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
