//
//  LBZFBTableView.h
//  LBZhiFuBao
//
//  Created by 刘博 on 2017/8/11.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBZFBTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
/// 接收数据
@property (nonatomic, strong) NSMutableArray *dataArray;
@end
