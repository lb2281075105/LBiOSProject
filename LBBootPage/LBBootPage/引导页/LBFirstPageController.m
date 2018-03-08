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
@property (nonatomic, strong) UIButton *imageViewButton;
@property (nonatomic, strong) UIImageView *imageView2;
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
    _pageControl.pageIndicatorTintColor = [UIColor redColor];// 设置非选中页的圆点颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor yellowColor]; // 设置选中页的圆点颜色
    [self.view addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_imageView);
        make.height.width.equalTo(@8);
        make.bottom.equalTo(@(-25));
    }];
    
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
    
    // 图片
    UIImageView *imageView1 = [[UIImageView alloc]init];
    [self.view addSubview:imageView1];
    imageView1.image = [UIImage imageNamed:@"游艇"];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@332);
        make.width.equalTo(@120);
        make.height.equalTo(@39);
        make.left.equalTo(@70);
    }];
    
    _imageView2 = [[UIImageView alloc]init];
    [self.view addSubview:_imageView2];
    _imageView2.image = [UIImage imageNamed:@"城市剪影"];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@242);
        make.width.equalTo(@(WIDTH));
        make.height.equalTo(@100);
        make.left.equalTo(@(0));
    }];
    
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
        // 游艇
        UIImageView *imageView2 = [[UIImageView alloc]init];
        [self.view addSubview:imageView2];
        imageView2.image = [UIImage imageNamed:@"游艇"];
        [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@332);
            make.width.equalTo(@(120));
            make.height.equalTo(@39);
            make.left.equalTo(@(70));
        }];
        // 城市
        _imageView2 = [[UIImageView alloc]init];
        [self.view addSubview:_imageView2];
        _imageView2.image = [UIImage imageNamed:@"城市剪影"];
        [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@242);
            make.width.equalTo(@(WIDTH));
            make.height.equalTo(@100);
            make.left.equalTo(@(-70));
        }];
        // 云
        UIImageView *imageView4 = [[UIImageView alloc]init];
        [self.view addSubview:imageView4];
        imageView4.image = [UIImage imageNamed:@"2.2"];
        [imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@180);
            make.width.equalTo(@(130));
            make.height.equalTo(@70);
            make.right.equalTo(@(-38));
        }];

    }else if (i == 2){
        _nameLabel.text = @"汽车";
        _englishLabel.text = @"Car";
        _imageView2 = [[UIImageView alloc]init];
        [self.view addSubview:_imageView2];
        _imageView2.image = [UIImage imageNamed:@"高架桥"];
        [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@284);
            make.width.equalTo(@(WIDTH));
            make.height.equalTo(@43);
            make.left.equalTo(@(0));
        }];
        UIImageView *imageView5 = [[UIImageView alloc]init];
        [self.view addSubview:imageView5];
        imageView5.image = [UIImage imageNamed:@"汽车剪影"];
        [imageView5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@263);
            make.width.equalTo(@(68));
            make.height.equalTo(@23);
            make.right.equalTo(@(110));
        }];

    }else if (i == 3){
        _nameLabel.text = @"游艇联盟";
        _englishLabel.text = @"Yacht Alliance";
        _imageViewButton = [[UIButton alloc]init];
        [_imageViewButton setImage:[UIImage imageNamed:@"圆角矩形 1"] forState:(UIControlStateNormal)];
        [self.view addSubview:_imageViewButton];
        [_imageViewButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@46);
            make.width.equalTo(@168);
            make.bottom.equalTo(@(-60));
            make.centerX.equalTo(_imageView);
        }];
        UILabel *lijiLabel = [[UILabel alloc]init];
        lijiLabel.text = @"立即开始";
        lijiLabel.font = [UIFont boldSystemFontOfSize:18];
        lijiLabel.textColor = [UIColor whiteColor];
        [_imageViewButton addSubview:lijiLabel];
        [lijiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_imageViewButton);

        }];
        [_timer invalidate];
        _timer = nil;
    }
}


@end
