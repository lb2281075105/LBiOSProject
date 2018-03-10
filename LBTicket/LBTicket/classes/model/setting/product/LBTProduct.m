//
//  LBTProduct.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTProduct.h"

@implementation LBTProduct
+ (instancetype)productWithDict:(NSDictionary *)dict
{
    LBTProduct *p = [[self alloc] init];
    p.title = dict[@"title"];
    p.icon = dict[@"icon"];
    return p;
}
@end
