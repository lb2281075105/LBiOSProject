//
//  LBTTabBarController.m
//  LBTicket
//
//  Created by liubo on 2017/9/13.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTTabBarController.h"
#import "LBTTabBar.h"
#import "LBTNavController.h"
#import "LBTMineController.h"
#import "LBTLuckyController.h"
#import "LBTInfoTableController.h"
#import "LBTHallTableController.h"
#import "LBTBuyController.h"
@interface LBTTabBarController ()<LBTTabBarDelegate>
@property (nonatomic, strong) LBTTabBar *lbtTabBar;
@end

@implementation LBTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 更改系统自带的TabBar
    [self setUpTabBar];
    // 添加子控制器
    [self addChildControllers];
    
}
// 添加子控制器
- (void)addChildControllers{
    /// 购彩大厅
    [self addChildViewController:[[LBTHallTableController alloc]init] withTitle:@"购彩大厅"];
    /// 合买跟单
    [self addChildViewController:[[LBTBuyController alloc]init] withTitle:@"合买跟单"];
    /// 开奖信息
    [self addChildViewController:[[LBTInfoTableController alloc]init] withTitle:@"开奖信息"];
    /// 幸运选号
    [self addChildViewController:[[LBTLuckyController alloc]init] withTitle:@"幸运选号"];
    /// 我的彩票
    [self addChildViewController:[[LBTMineController alloc]init] withTitle:@"我的彩票"];
}
///添加子控制器
- (void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title{

    childController.navigationItem.title = title;
    LBTNavController *nav = [[LBTNavController alloc]initWithRootViewController:childController];

    [self addChildViewController:nav];
}
// 更改系统自带的TabBar
- (void)setUpTabBar{

    LBTTabBar *lbtTabBar = [[LBTTabBar alloc]init];
    _lbtTabBar = lbtTabBar;
    lbtTabBar.frame = self.tabBar.bounds;
    lbtTabBar.delegate = self;
    // 把LBTTabBar添加到tabBar上面
    [self.tabBar addSubview:lbtTabBar];
    // 设置TabBar(LBTTabBar是继承UIView下面这句代码不能使用)
    // [self setValue:lbtTabBar forKey:@"tabBar"];
    
    // 在TabBar添加5个按钮
    for (int i = 1; i<=5; i++) {
        NSString *normal = [NSString stringWithFormat:@"TabBar%d", i];
        NSString *selected = [normal stringByAppendingString:@"Sel"];
        [lbtTabBar addTabBarButton:normal selIcon:selected];
    }

}

- (void)tabBar:(LBTTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to
{
    self.selectedIndex = to;
}

@end
