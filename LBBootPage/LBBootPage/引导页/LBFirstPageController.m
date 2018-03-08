//
//  LBFirstPageController.m
//  LBBootPage
//
//  Created by liubo on 2018/3/8.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "LBFirstPageController.h"
#import "Masonry.h"
#import "UIColor+colorWithHex.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LBFirstPageController ()<UIScrollViewDelegate>{
    NSTimer *_timer;
}
@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIImageView *startImage;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *englishLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation LBFirstPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadBackground];
    [self setUpPageCircle];
    
    // 设置文本
    [self setUpLabel];
}

- (void)loadBackground{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _imageView = imageView;
    NSString *nameString = [NSString stringWithFormat:@"background"];
    imageView.image = [UIImage imageNamed:nameString];
    [self.view addSubview:imageView];
}
- (void)setUpPageCircle{
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.numberOfPages = 4;
    _pageControl.currentPage = 0;
    _pageControl.frame = CGRectMake((WIDTH - 8) / 2.0, HEIGHT - 35, 8, 8);
    _pageControl.pageIndicatorTintColor = [UIColor redColor];// 设置非选中页的圆点颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor yellowColor]; // 设置选中页的圆点颜色
    [self.view addSubview:_pageControl];
    
    
    _timer =  [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(function) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:3 repeats:NO block:^(NSTimer * _Nonnull timer) {
    }];
}
- (void)setUpLabel{
    _nameLabel = [[UILabel alloc]init];
    _englishLabel = [[UILabel alloc]init];
    _nameLabel.text = @"游艇";
    _englishLabel.text = @"Yacht";
    _nameLabel.font = [UIFont systemFontOfSize:27];
    _englishLabel.font = [UIFont systemFontOfSize:27];
    _nameLabel.textColor = [UIColor colorWithRed:17 / 255.0 green:40 / 255.0 blue:86 / 255.0 alpha:1];
    _englishLabel.textColor = [UIColor colorWithRed:17 / 255.0 green:40 / 255.0 blue:86 / 255.0 alpha:1];

    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _englishLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_nameLabel];
    [self.view addSubview:_englishLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-184));
        make.centerX.equalTo(_imageView);
        make.height.equalTo(@26);
        make.width.equalTo(@150);
    }];
    [_englishLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-150));
        make.centerX.equalTo(_imageView);
        make.height.equalTo(@24);
        make.width.equalTo(@180);
    }];

}
- (void)function{
    static int i = 0;
    i++;
    _pageControl.currentPage = i;
    
    if (i == 1) {
        _nameLabel.text = @"飞机";
        _englishLabel.text = @"Plane";
    }else if (i == 2){
        _nameLabel.text = @"汽车";
        _englishLabel.text = @"Car";
    }else if (i == 3){
        _nameLabel.text = @"游艇联盟";
        _englishLabel.text = @"Yacht Alliance";
        [_timer invalidate];
        _timer = nil;
    }
}


@end
