//
//  LBSingle.h
//  LBBootPage
//
//  Created by liubo on 2018/3/8.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBSingle : NSObject
/// 是否是第一次加载引导页
- (void)setLoadBootPage:(BOOL)key;
/// 是否是第一次加载引导页
- (BOOL)getLoadBootPage;
+ (LBSingle *)defaultSingle;
@end
