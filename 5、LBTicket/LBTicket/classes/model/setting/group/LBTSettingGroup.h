//
//  LBTSettingGroup.h
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBTSettingGroup : NSObject
/// 头部标题
@property (nonatomic, copy) NSString *headerTitle;
/// 尾部标题
@property (nonatomic, copy) NSString *footerTitle;
/// 中间的item数量
@property (nonatomic, strong) NSArray *items;
/// 构造器
+ (instancetype)groupWithItems:(NSArray *)items;
@end
