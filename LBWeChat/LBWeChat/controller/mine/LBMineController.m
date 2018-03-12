//
//  LBMineController.m
//  LBWeChat
//
//  Created by liubo on 2018/3/12.
//  Copyright © 2018年 刘博. All rights reserved.
//

#import "LBMineController.h"
#import "LBMineHeaderCell.h"
#import "LBMineCell.h"
@interface LBMineController ()<UITableViewDataSource,UITableViewDelegate>{
    CGRect oldFrame;
    UIImageView *fullScreenIV;
}

@property(nonatomic,retain)NSMutableArray *dataArray;
@property(nonatomic,retain)UITableView *mineTableView;

@end

@implementation LBMineController
-(NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray = [NSMutableArray arrayWithObjects:
                      @[@{@"title":@"JCSON",@"icon":@"MoreExpressionShops"}],
                      @[@{@"title":@"相册",@"icon":@"ff_IconShowAlbum"},@{@"title":@"收藏",@"icon":@"MoreMyFavorites"},@{@"title":@"钱包",@"icon":@"MoreMyBankCard"},@{@"title":@"卡券",@"icon":@"MyCardPackageIcon"}],
                      @[@{@"title":@"表情",@"icon":@"MoreExpressionShops"}],
                      @[@{@"title":@"设置",@"icon":@"MoreSetting"}], nil];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTv];
    
}
-(void)setUpTv{
    _mineTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _mineTableView.dataSource = self;
    _mineTableView.delegate =  self;
    [_mineTableView registerNib:[UINib nibWithNibName:@"LBMineHeaderCell" bundle:nil] forCellReuseIdentifier:@"LBMineHeaderCell"];
    [_mineTableView registerNib:[UINib nibWithNibName:@"LBMineCell" bundle:nil] forCellReuseIdentifier:@"LBMineCell"];
    [self.view addSubview:_mineTableView];
    _mineTableView.tableFooterView = [UIView new];
    
    [_mineTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(kNavbarHeight, 0, 0, 0));
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count + 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section) {
        NSArray *rowArray = self.dataArray[section-1];
        return rowArray.count;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section) {
        return 42;
    }
    return 82;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section) {
        return 20;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return kAlmostZero;
}
-(void)tapForOriginal:(UITapGestureRecognizer *)tap{
    [UIView animateWithDuration:0.3 animations:^{
        fullScreenIV.frame = oldFrame;
        fullScreenIV.alpha = 0.03;
    } completion:^(BOOL finished) {
        fullScreenIV.alpha = 1;
        [fullScreenIV removeFromSuperview];
        
    }];
}
-(void)tapForFullScreen:(UITapGestureRecognizer *)tap{
    UIImageView *avatarIV = (UIImageView *)[tap view];
    oldFrame = [avatarIV convertRect:avatarIV.bounds toView:[UIApplication sharedApplication].keyWindow];
    if (fullScreenIV==nil) {
        fullScreenIV= [[UIImageView alloc]initWithFrame:avatarIV.frame];
    }
    fullScreenIV.backgroundColor = [UIColor blackColor];
    fullScreenIV.userInteractionEnabled = YES;
    fullScreenIV.image = avatarIV.image;
    fullScreenIV.contentMode = UIViewContentModeScaleAspectFit;
    [[UIApplication sharedApplication].keyWindow addSubview:fullScreenIV];
    
    [UIView animateWithDuration:0.3 animations:^{
        fullScreenIV.frame = CGRectMake(0,0,kScreenWidth, kScreenHeight);
    }];
    UITapGestureRecognizer *originalTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapForOriginal:)];
    [fullScreenIV addGestureRecognizer:originalTap];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        LBMineHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"LBMineHeaderCell"];
        headerCell.selectionStyle  = UITableViewCellSelectionStyleNone;
        headerCell.imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *fullScreenTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapForFullScreen:)];
        [headerCell.imageView addGestureRecognizer:fullScreenTap];
        headerCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return headerCell;
    }else{
        
        LBMineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LBMineCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.section==2) {
            
            switch (indexPath.row) {
                case 0:
                    cell.imageView.image = [UIImage imageNamed:@"ff_IconShowAlbum"];
                    cell.titleLabel.text = @"相册";
                    break;
                case 1:
                    cell.imageView.image = [UIImage imageNamed:@"MoreMyFavorites"];
                    cell.titleLabel.text = @"收藏";
                    break;
                case 2:
                    cell.imageView.image = [UIImage imageNamed:@"MoreMyBankCard"];
                    cell.titleLabel.text = @"钱包";
                    break;
                case 3:
                    cell.imageView.image = [UIImage imageNamed:@"MyCardPackageIcon"];
                    cell.titleLabel.text = @"卡券";
                    break;
                    
                default:
                    break;
            }
            
        }else if (indexPath.section==3){//设置
            cell.imageView.image = [UIImage imageNamed:@"MoreExpressionShops"];
            cell.titleLabel.text = @"表情";
            
        }else if(indexPath.section==4){
            cell.imageView.image = [UIImage imageNamed:@"MoreSetting"];
            cell.titleLabel.text = @"设置";
        }
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)dealloc{
    fullScreenIV = nil;
    _mineTableView = nil;
}

@end
