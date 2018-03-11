//
//  LBTTabBar.h
//  LBTicket
//
//  Created by liubo on 2017/9/13.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LBTTabBar;

@protocol LBTTabBarDelegate <NSObject>

@optional
- (void)tabBar:(LBTTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to;

@end
/// mark -- 自定义UITabBar
/// 1.下面是第一个方法
@interface LBTTabBar : UIView
/// 2.LBTTabBar继承自系统的UITabBar，再进行设置title和image
- (void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon;
@property (nonatomic, weak) id<LBTTabBarDelegate> delegate;

@end
