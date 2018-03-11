//
//  LBTMineController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTMineController.h"
#import "UIImage+Fit.h"
#import "LBTSettingController.h"
@interface LBTMineController ()
@property (strong, nonatomic) UIButton *loginBtn;
@property (strong, nonatomic) UIImageView *imageview;
@end

@implementation LBTMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 背景色
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    // 设置上部视图
    [self setUpTopImgaeView];
    // 登录按钮
    [self setUpLoginButton];
    // 右上角设置
    [self setUpInfoButton];
}
// 设置
- (void)setUpInfoButton{
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"设置" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightButton addTarget:self action:@selector(setButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@30);
    }];
}
// 点击
- (void)setButtonClick{
    LBTLog(@"点击了");
    [self.navigationController pushViewController:[[LBTSettingController alloc]init] animated:YES];
}
// 设置上部视图
- (void)setUpTopImgaeView{

    UIImageView *imageview = [[UIImageView alloc]init];
    _imageview = imageview;
    imageview.image = [UIImage imageNamed:@"LoginScreen"];
    [self.view addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@140);
    }];
}
// 设置登录按钮
- (void)setUpLoginButton{
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButton"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButtonPressed"] forState:UIControlStateHighlighted];
    [_loginBtn addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_imageview.mas_bottom).offset(20);
        make.width.equalTo(@([UIScreen cz_screenWidth] - 40));
        make.height.equalTo(@40);
    }];
}
// 点击
- (void)loginButtonClick{
    LBTLog(@"登录");
}
@end
