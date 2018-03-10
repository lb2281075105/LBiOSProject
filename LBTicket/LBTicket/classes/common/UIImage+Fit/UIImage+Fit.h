//
//  UIImage+Fit.h
//  SinaWeibo
//
//  Created by yz on 13-8-19.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Fit)
#pragma mark 返回拉伸好的图片
+ (UIImage *)resizeImage:(NSString *)imgName;

- (UIImage *)resizeImage;
@end
