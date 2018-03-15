//
//  AppDelegate.m
//  LBDisplayPage
//
//  Created by liubo on 2018/3/15.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "AppDelegate.h"
#import "LBDisplayPageController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[LBDisplayPageController alloc]init];
    
    return YES;
}
@end
