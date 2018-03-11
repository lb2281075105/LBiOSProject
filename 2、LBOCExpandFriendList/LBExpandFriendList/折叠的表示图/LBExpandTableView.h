//
//  LBExpandTableView.h
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/19.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBExpandTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *sectionTitleArray;
@property(nonatomic,strong)NSMutableArray *sectionStateArray;
@property(nonatomic,strong)NSMutableArray *dataSourceArray;
@end
