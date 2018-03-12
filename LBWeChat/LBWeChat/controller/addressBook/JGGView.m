//
//  JGGView.m
//  AIHealth
//
//  Created by 郑文明 on 2017/7/17.
//  Copyright © 2017年 郑文明. All rights reserved.
//

#import "JGGView.h"
#import "YYAnimatedImageView.h"
#import "UIImageView+WebCache.h"
@implementation JGGView
-(void)tapImageAction:(UITapGestureRecognizer *)tap{
    UIImageView *tapView = (UIImageView *)tap.view;
    if (self.tapBlock) {
        self.tapBlock(tapView.tag,self.dataSource);
    }
}

-(void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    //单张图片的大小
    CGFloat jgg_width = kScreenWidth-2*kGAP-kAvatar_Size-50;

    CGFloat imageWidth =  (jgg_width-2*kGAP)/3;
    CGFloat imageHeight =  imageWidth;
    for (NSUInteger i=0; i<dataSource.count; i++) {
        YYAnimatedImageView *iv = [[YYAnimatedImageView alloc]initWithFrame:CGRectMake(0+(imageWidth+kGAP)*(i%3),floorf(i/3.0)*(imageHeight+kGAP),imageWidth, imageHeight)];
            if ([dataSource[i] isKindOfClass:[UIImage class]]) {
            iv.image = dataSource[i];
        }else if ([dataSource[i] isKindOfClass:[NSString class]]){
            [iv sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dataSource[i]]] placeholderImage:[UIImage imageNamed:@"placeholder"]];

        }else if ([dataSource[i] isKindOfClass:[NSURL class]]){
            [iv sd_setImageWithURL:dataSource[i] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        }
        iv.userInteractionEnabled = YES;//默认关闭NO，打开就可以接受点击事件
        iv.tag = i;
        iv.autoPlayAnimatedImage = YES;
        [self addSubview:iv];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
        [iv addGestureRecognizer:singleTap];
    }
}

@end

