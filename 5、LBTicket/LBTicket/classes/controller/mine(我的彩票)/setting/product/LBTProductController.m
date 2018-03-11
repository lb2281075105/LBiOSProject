//
//  LBTProductController.m
//  LBTicket
//
//  Created by yunmei on 2017/9/14.
//  Copyright © 2017年 liubo. All rights reserved.
//

#import "LBTProductController.h"
#import "LBTProduct.h"
#import "LBTProductCell.h"
NSString *const lbtProductCell = @"LBTProductCell";

@interface LBTProductController ()
@property (nonatomic, strong) NSMutableArray *products;
@end

@implementation LBTProductController

- (id)init
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    /// 设置每一个各自的大小
    flow.itemSize = CGSizeMake(80, 80);
    /// 水平方向上的间距 == 0
    flow.minimumInteritemSpacing = 0;
    /// 垂直方向上的间距 ==
    /// flow.minimumLineSpacing = 40;
    flow.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    return [self initWithCollectionViewLayout:flow];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"其他产品推荐";
    
    /// 加载JSON
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"product.json" withExtension:nil]] options:NSJSONReadingAllowFragments error:nil];
    
    /// 创建产品模型
    _products = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        LBTProduct *p = [LBTProduct productWithDict:dict];
        [_products addObject:p];
    }
    
    /// 注册
    [self.collectionView registerClass:[LBTProductCell class] forCellWithReuseIdentifier:lbtProductCell];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
}

/// 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LBTProductCell *productCell = [collectionView dequeueReusableCellWithReuseIdentifier:lbtProductCell forIndexPath:indexPath];
    productCell.product = self.products[indexPath.item];
    return productCell;
}
@end
