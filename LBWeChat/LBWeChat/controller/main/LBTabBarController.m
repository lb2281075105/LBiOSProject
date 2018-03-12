//
//  LBTabBarController.m
//  LBWeChat
//
//  Created by liubo on 2018/3/12.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "LBTabBarController.h"
#import "LBHomeController.h"
#import "LBDiscoverController.h"
#import "LBAddressBookController.h"
#import "LBMineController.h"
#import "LBBaseNavController.h"
@interface LBTabBarController ()

@end

@implementation LBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildViewControllers];
}

- (void)addChildViewControllers{
    ///微信
    [self addChildViewController:[[LBHomeController alloc]init] withNormalImage:@"tabbar_mainframe" withSelectImage:@"tabbar_mainframeHL" withTitle:@"微信"];
    ///通讯录
    [self addChildViewController:[[LBAddressBookController alloc]init] withNormalImage:@"tabbar_contacts" withSelectImage:@"tabbar_contactsHL" withTitle:@"通讯录"];
    ///发现
    [self addChildViewController:[[LBDiscoverController alloc]init] withNormalImage:@"tabbar_discover" withSelectImage:@"tabbar_discoverHL" withTitle:@"发现"];
    ///我
    [self addChildViewController:[[LBMineController alloc]init] withNormalImage:@"tabbar_me" withSelectImage:@"tabbar_meHL" withTitle:@"我"];
}
///添加子控制器
- (void)addChildViewController:(UIViewController *)childController withNormalImage:(NSString *)normalImage withSelectImage:(NSString *)selectImage withTitle:(NSString *)title{
    
    childController.tabBarItem.image = [UIImage imageNamed:normalImage];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    childController.title = title;
    
    LBBaseNavController *nav = [[LBBaseNavController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
}


@end
