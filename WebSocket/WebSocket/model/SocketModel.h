//
//  SocketModel.h
//  WebSocket
//
//  Created by 云媒 on 2017/7/7.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface SocketModel : NSObject

@property (nonatomic, strong)NSString *cmd;
@property (nonatomic, strong)NSString *shopname;
@property (nonatomic, strong)NSString *order_id;
@property (nonatomic, strong)NSString *address;
@property (nonatomic, strong)NSString *remarks;
@property (nonatomic, strong)NSString *total_amount;
@property (nonatomic, strong)NSArray *goods;

@property (nonatomic, strong) NSString *product_id;
@property (nonatomic, strong) NSString *nums;
@property (nonatomic, strong) NSString *barcode;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL *small_pic;
@end
