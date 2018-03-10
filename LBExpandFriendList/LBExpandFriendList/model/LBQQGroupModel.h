//
//  LBQQGroupModel.h
//  LBExpandFriendList
//
//  Created by yunmei on 2018/1/20.
//  Copyright © 2018年 yunmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBQQGroupModel : NSObject
@property (nonatomic, assign)BOOL isOpened;
@property (nonatomic, retain)NSString *sectionName;
@property (nonatomic, assign)NSInteger sectionCount;
@property (nonatomic, retain)NSArray *rows;
@end
