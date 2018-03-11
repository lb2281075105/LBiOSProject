//
//  AppDelegate.m
//  LBZhiFuBao
//
//  Created by 刘博 on 2017/8/11.
//  Copyright © 2017年 liubo. All rights reserved.
//  支付宝生活圈的自动布局

#import "AppDelegate.h"
#import "LBZFBController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    [self.window makeKeyAndVisible];

    self.window.rootViewController = [[LBZFBController alloc]init];
    
    return YES;
}
@end
