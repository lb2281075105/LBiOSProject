//
//  LBZFBModel.m
//  LBZhiFuBao
//
//  Created by 刘博 on 2017/8/11.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBZFBModel.h"

@implementation LBZFBModel
- (instancetype)initWithDict:(NSDictionary *)dic{

    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}
+ (instancetype)modelWithDict:(NSDictionary *)dic{
    return [[self alloc]initWithDict:dic];
}
@end
