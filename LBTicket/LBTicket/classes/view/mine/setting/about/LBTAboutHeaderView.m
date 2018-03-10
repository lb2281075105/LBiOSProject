//
//  LBTAboutHeaderView.m
//  LBTicket
//
//  Created by yunmei on 2017/9/15.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTAboutHeaderView.h"

@implementation LBTAboutHeaderView

+ (instancetype)headerView
{
    return [[NSBundle mainBundle] loadNibNamed:@"LBTAboutHeaderView" owner:nil options:nil][0];
}

@end
