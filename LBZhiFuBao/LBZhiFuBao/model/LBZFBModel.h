//
//  LBZFBModel.h
//  LBZhiFuBao
//
//  Created by 刘博 on 2017/8/11.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBZFBModel : NSObject
/// 名称
@property (nonatomic, strong)NSString *name;
/// 图片
@property (nonatomic, strong)NSString *icon;
/// 时间
@property (nonatomic, strong)NSString *time;
/// 内容
@property (nonatomic, strong)NSString *content;

- (instancetype)initWithDict:(NSDictionary *)dic;
+ (instancetype)modelWithDict:(NSDictionary *)dic;
@end
