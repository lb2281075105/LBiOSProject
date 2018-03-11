//
//  LBTHeader.h
//  LBTicket
//
//  Created by liubo on 2017/9/13.
//  Copyright © 2017年 liubo. All rights reserved.
//

// 宏定义

#ifdef DEBUG
#define LBTLog(...) NSLog(__VA_ARGS__)
#define LBTColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#else
#define LBTLog(...)
#endif
