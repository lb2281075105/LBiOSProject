//
//  LBTHelpController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTHelpController.h"
#import "LBTHelpPage.h"
#import "LBTHelpHtmlController.h"
#import "LBTNavController.h"
@interface LBTHelpController ()
{
   NSMutableArray *_htmlPages;
}
@end

@implementation LBTHelpController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"帮助";
    
    /// 加载JSON----help.json
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"help.json" withExtension:nil]] options:NSJSONReadingAllowFragments error:nil];
    
    /// 便利数组，创建所有的item
    _htmlPages = [NSMutableArray array];
    NSMutableArray *items = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        /// 创建网页model模型
        LBTHelpPage *hp = [LBTHelpPage helpPageWithDict:dict];
        [_htmlPages addObject:hp];
        
        /// 每一行cell对应的item
        LBTSettingArrowItem *arrow = [LBTSettingArrowItem itemWithTitle:hp.title];
        [items addObject:arrow];
    }
    
    /// 添加一组
    LBTSettingGroup *group = [LBTSettingGroup groupWithItems:items];
    [self.groupArray addObject:group];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /// 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /// 跳到html控制器
    LBTHelpHtmlController *htmlVc = [[LBTHelpHtmlController alloc] init];
    htmlVc.htmlPage = _htmlPages[indexPath.row];
    
    LBTNavController *nav = [[LBTNavController alloc] initWithRootViewController:htmlVc];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
