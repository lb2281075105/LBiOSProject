//
//  SocketTableViewCell.h
//  WebSocket
//
//  Created by 云媒 on 2017/7/6.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketModel.h"
#import "SocketGoodsModel.h"
@interface SocketTableViewCell : UITableViewCell
@property (nonatomic, strong) SocketGoodsModel *model;
@end
