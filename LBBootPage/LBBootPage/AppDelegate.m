//
//  AppDelegate.m
//  LBBootPage
//
//  Created by liubo on 2018/3/8.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "AppDelegate.h"
#import "LBSingle.h"
#import "LBFirstPageController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    [self loadBootPage];
    
    return YES;
}

- (void)loadBootPage{

    if (![[LBSingle defaultSingle]getLoadBootPage]) {
        self.window.rootViewController = [[LBFirstPageController alloc]init];
        [[LBSingle defaultSingle]setLoadBootPage:true];
    }else{
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        ViewController *viewController = [storyboard instantiateInitialViewController];
//        self.window.rootViewController = viewController;
    }
}



@end
