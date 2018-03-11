//
//  SocketNavController.m
//  WebSocket
//
//  Created by 云媒 on 2017/7/11.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import "SocketNavController.h"

@interface SocketNavController ()

@end

@implementation SocketNavController
+(void)initialize{

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"b_03"] forState:UIControlStateNormal];
    [rightButton setTitle:@"  返回" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
}
- (void)rightButtonMethod{

    [self.navigationController popViewControllerAnimated:YES];
}

@end
