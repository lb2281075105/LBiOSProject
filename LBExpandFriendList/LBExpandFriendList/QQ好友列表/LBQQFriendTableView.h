//
//  LBQQFriendTableView.h
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBQQFriendTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataSourceArray;
@end
