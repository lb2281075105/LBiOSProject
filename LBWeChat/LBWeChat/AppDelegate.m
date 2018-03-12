//
//  AppDelegate.m
//  LBWeChat
//
//  Created by liubo on 2018/3/12.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "AppDelegate.h"
#import "LBTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [LBTabBarController new];
    [UIApplication sharedApplication].statusBarHidden = NO;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    return YES;
}





@end
