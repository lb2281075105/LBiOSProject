//
//  SocketGoodsModel.h
//  WebSocket
//
//  Created by 云媒 on 2017/7/7.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketGoodsModel : NSObject

@property (nonatomic, strong) NSString *product_id;
@property (nonatomic, strong) NSString *nums;
@property (nonatomic, strong) NSString *barcode;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *small_pic;

@end
