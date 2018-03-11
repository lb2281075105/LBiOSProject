//
//  LBTSettingTool.h
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBTSettingTool : NSObject
/// 存储
+ (void)setBool:(BOOL)b forKey:(NSString *)key;
+ (BOOL)boolForKey:(NSString *)key;

+ (void)setObject:(id)obj forKey:(NSString *)key;
+ (id)objectForKey:(NSString *)key;
@end
