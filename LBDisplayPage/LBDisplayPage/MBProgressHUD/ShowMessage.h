//
//  ShowMessage.h
//  LiudaTicket
//
//  Created by Eric on 13-12-24.
//  Copyright (c) 2013年 JiNanTuYiWangLuoKejiCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
@interface ShowMessage : NSObject <MBProgressHUDDelegate>

#pragma mark 简单MBProgressHUD
+(void)showSimple:(UIView *) viewInfo executing:(SEL)method target:(id)target;

#pragma mark 带有简单信息的消息提示
+(void)showWithLabel:(NSString *)strMessage messageView:(UIView *) viewInfo executing:(SEL)method target:(id)target;

#pragma mark 带有详细信息的消息提示
+(void)showWithDetailsLabel:(NSString *)strMessage detailsLabelText:(NSString *) detailsLabelText messageView:(UIView *) viewInfo executing:(SEL)method target:(id)target;

#pragma mark 自定义消息提示
+(void)showWithCustomView:(NSString *)strMessage messageView:(UIView *) viewInfo target:(id)target;

#pragma mark 带有灰色透明背景的消息提示
+(void)showWithGradient:(NSString *)strMessage messageView:(UIView *) viewInfo executing:(SEL)method target:(id)target;

#pragma mark 纯文本的消息提示
+(void)showTextOnly:(NSString *)strMessage messageView:(UIView *) viewInfo;

#pragma mark 信息加载时返回一个实例MBProgressHUD
+(MBProgressHUD *)showLoadingData:(UIView *) viewInfo;
@end
