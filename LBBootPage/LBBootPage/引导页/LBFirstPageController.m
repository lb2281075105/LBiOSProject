//
//  LBFirstPageController.m
//  LBBootPage
//
//  Created by liubo on 2018/3/8.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "LBFirstPageController.h"
#import "Masonry.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LBFirstPageController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIImageView *startImage;
@end

@implementation LBFirstPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadImage];
}

- (void)loadImage{
    [self createScrollView];
    [self createButton];
}

- (void)createButton{
//    _button = [UIButton buttonWithType:UIButtonTypeCustom];
//    // 将button隐藏
//    _button.hidden = true;
//    _button.backgroundColor = [UIColor clearColor];
//    [_button addTarget:self action:@selector(closeButton) forControlEvents:(UIControlEventTouchUpInside)];
//    [self.view addSubview:_button];
//    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self).offset(-30);
//        make.centerX.equalTo(self);
//        make.height.equalTo(@60);
//        make.width.equalTo(@200);
//    }];
}
- (void)closeButton{

}

- (void)createScrollView{
    //分页
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(WIDTH * 4, HEIGHT);
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    for (int i = 1; i < 5; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((i-1) * WIDTH, 0, WIDTH, HEIGHT)];
        NSString *nameString = [NSString stringWithFormat:@"%d.jpeg",i];
        NSLog(@"%@",nameString);
        imageView.image = [UIImage imageNamed:nameString];
        [_scrollView addSubview:imageView];
    }
    
}
/// 已经结束减速
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //判断当前页数
    int index = (int)scrollView.contentOffset.x / WIDTH;
    if(index == 3){
        _button.hidden = false;
    } else {
        _button.hidden = true;
    }
}

@end
