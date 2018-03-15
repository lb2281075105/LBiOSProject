//
//  ShowMessage.m
//  LiudaTicket
//
//  Created by Eric on 13-12-24.
//  Copyright (c) 2013年 JiNanTuYiWangLuoKejiCompany. All rights reserved.
//

#import "ShowMessage.h"

@implementation ShowMessage

MBProgressHUD *HUD;
#pragma mark 简单MBProgressHUD
+(void)showSimple:(UIView *)viewInfo executing:(SEL)method target:(id)target
{
    HUD = [[MBProgressHUD alloc] initWithView:viewInfo];
	[viewInfo addSubview:HUD];
    
	HUD.delegate = target;
    
	[HUD showWhileExecuting:method onTarget:target withObject:nil animated:YES];
}
#pragma mark 带有简单信息的消息提示
+(void)showWithLabel:(NSString *)strMessage messageView:(UIView *)viewInfo executing:(SEL)method target:(id)target
{
    HUD = [[MBProgressHUD alloc] initWithView:viewInfo];
	[viewInfo addSubview:HUD];
    
	HUD.delegate = target;
	HUD.labelText = strMessage;
    
	[HUD showWhileExecuting:method onTarget:target withObject:nil animated:YES];

}
#pragma mark 带有详细信息的消息提示
+(void)showWithDetailsLabel:(NSString *)strMessage detailsLabelText:(NSString *)detailsLabelText messageView:(UIView *)viewInfo executing:(SEL)method target:(id)target
{
    HUD = [[MBProgressHUD alloc] initWithView:viewInfo];
	[viewInfo addSubview:HUD];
    
	HUD.delegate = target;
	HUD.labelText = strMessage;
    HUD.detailsLabelText = detailsLabelText;
	HUD.square = YES;
    
	[HUD showWhileExecuting:method onTarget:target withObject:nil animated:YES];

}
#pragma mark 自定义消息提示
+(void)showWithCustomView:(NSString *)strMessage messageView:(UIView *)viewInfo target:(id)target
{
    HUD = [[MBProgressHUD alloc] initWithView:viewInfo];
	[viewInfo addSubview:HUD];
    
    //37像素x37像素
	HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
	HUD.mode = MBProgressHUDModeCustomView;
	HUD.delegate = target;
	HUD.labelText = strMessage;
	
	[HUD show:YES];
	[HUD hide:YES afterDelay:3];

}

#pragma mark 带有灰色透明背景的消息提示
+(void)showWithGradient:(NSString *)strMessage messageView:(UIView *)viewInfo executing:(SEL)method target:(id)target
{
    HUD = [[MBProgressHUD alloc] initWithView:viewInfo];
	[viewInfo addSubview:HUD];
	
	HUD.dimBackground = YES;
	HUD.delegate = target;
	
	[HUD showWhileExecuting:method onTarget:target withObject:nil animated:YES];
}

#pragma mark 纯文本的消息提示
+(void)showTextOnly:(NSString *)strMessage messageView:(UIView *)viewInfo
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewInfo animated:YES];

	hud.mode = MBProgressHUDModeText;
	hud.labelText = strMessage;
	hud.margin=10.f;
	hud.removeFromSuperViewOnHide = YES;
	
	[hud hide:YES afterDelay:1];

}
#pragma mark 信息加载时返回一个实例MBProgressHUD
+(MBProgressHUD *)showLoadingData:(UIView *)viewInfo
{
    __weak MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewInfo animated:YES];
    
    hud.labelText = @"正在加载";
    hud.labelFont=[UIFont systemFontOfSize:12.0];
	hud.square = YES;
    hud.removeFromSuperViewOnHide=YES;
    
    return hud;
}
#pragma mark -
#pragma mark MBProgressHUDDelegate methods
-(void)hudWasHidden:(MBProgressHUD *)hud
{
   [HUD removeFromSuperview];
    hud=nil;
}
@end
