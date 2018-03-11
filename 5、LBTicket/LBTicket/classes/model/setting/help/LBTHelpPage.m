//
//  LBTHelpPage.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTHelpPage.h"

@implementation LBTHelpPage
+ (instancetype)helpPageWithDict:(NSDictionary *)dict
{
    LBTHelpPage *hp = [[self alloc] init];
    hp.title = dict[@"title"];
    hp.html = dict[@"html"];
    /// mark -- 这个也可以把id转化为ID
    hp.ID = dict[@"id"];
    return hp;
}
@end
