//
//  LBTSettingItem.h
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBTSettingItem : NSObject
/// 图片
@property (nonatomic, copy) NSString *icon;
/// 标题
@property (nonatomic, copy) NSString *title;
/// 副标题
@property (nonatomic, copy) NSString *subtitle;
/// 点击cell(item)后要执行的操作
@property (nonatomic, copy) void (^itemClick)();
/// 构造器
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;
@end
