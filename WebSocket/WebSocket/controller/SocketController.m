//
//  ViewController.m
//  WebSocket
//
//  Created by 云媒 on 2017/7/6.
//  Copyright © 2017年 yunmei. All rights reserved.
//

#import "SocketController.h"
#import "SRWebSocket.h"
#import "UIView+Toast.h"
#import "SDAutoLayout.h"
#import "Masonry.h"
#import "SocketTableView.h"
#import "SocketModel.h"
#import "SocketGoodsModel.h"
#import "WebController.h"
#import "SocketNavController.h"
#import <AVFoundation/AVFoundation.h>
#import "SocketNetworkManager.h"
#import <UIImageView+WebCache.h>
#import <UserNotifications/UserNotifications.h>
#define kNotificationCategoryIdentifile @"kNotificationCategoryIdentifile"
#define kNotificationActionIdentifileStar @"kNotificationActionIdentifileStar"
#define kNotificationActionIdentifileComment @"kNotificationActionIdentifileComment"

#define kLocalNotificationKey @"kLocalNotificationKey"
#import "SocketModel.h"

@interface SocketController ()<SRWebSocketDelegate>
{

    AFHTTPSessionManager * _sessionManager;
    UIImageView *_imageView;
    UIButton *_delete;
}
@property (nonatomic, strong)SRWebSocket *webSocket;
@property (nonatomic, strong)SocketTableView *socketTableView;
@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)UIButton *buttonClose;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, strong)AVAudioPlayer *player;


@end

@implementation SocketController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///链接
    [self connect];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"click" ofType:@"mp3"]] error:nil];//使用本地URL创建
    _player.volume = 1;
    _player.numberOfLoops = 0;//默认只播放一次
    
    [self loadData];
    
    UIButton *send = [UIButton buttonWithType:UIButtonTypeCustom];
    send.backgroundColor = [UIColor blueColor];
    [send setTitle:@"发送" forState:UIControlStateNormal];
    [send setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [send addTarget:self action:@selector(sendNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:send];
    [send mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(150);
        make.right.equalTo(self.view).offset(-190);
        make.width.height.equalTo(@60);
    }];
    [NSTimer scheduledTimerWithTimeInterval:10 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"时间");
        self.webSocket.delegate = nil;
        [_webSocket close];

        [self buttonConnect];
    }];
   ///创建表视图
    [self setUpTableView];
}
- (void)setUpTableView{

    _socketTableView = [[SocketTableView alloc]initWithFrame:CGRectMake(0, 200, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height - 200) style:UITableViewStyleGrouped];
    [self.view addSubview:_socketTableView];
}
- (void)sendNotification{

    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        [self sendiOS10LocalNotification];
    } else {
        [self sendiOS8LocalNotification];
    }
}
- (void)sendiOS10LocalNotification
{
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.body = @"云仓提醒您，您有新的订单";
    content.badge = @(1);
    content.title = @"";
    content.subtitle = @"";
    content.categoryIdentifier = kNotificationCategoryIdentifile;
    content.userInfo = @{kLocalNotificationKey: @"iOS10推送"};
    //    content.launchImageName = @"xiamu";
    //推送附件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"click" ofType:@"mp3"];
    NSError *error = nil;
    UNNotificationAttachment *attachment = [UNNotificationAttachment attachmentWithIdentifier:@"AttachmentIdentifile" URL:[NSURL fileURLWithPath:path] options:nil error:&error];
    content.attachments = @[attachment];
    
    //推送类型
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"Test" content:content trigger:trigger];
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"iOS 10 发送推送， error：%@", error);
    }];
}

- (void)sendiOS8LocalNotification
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    //触发通知时间
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    //重复间隔
    //    localNotification.repeatInterval = kCFCalendarUnitMinute;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    //通知内容
    localNotification.alertBody = @"i am a test local notification";
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    //通知参数
    localNotification.userInfo = @{kLocalNotificationKey: @"iOS8推送"};
    
    localNotification.category = kNotificationCategoryIdentifile;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (IBAction)btnCancelSend_Click:(id)sender
{
    for (UILocalNotification *obj in [UIApplication sharedApplication].scheduledLocalNotifications) {
        if ([obj.userInfo.allKeys containsObject:kLocalNotificationKey]) {
            [[UIApplication sharedApplication] cancelLocalNotification:obj];
        }
    }
    //直接取消全部本地通知
    //[[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)loadData{

    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    [[UIApplication sharedApplication].keyWindow addSubview:_imageView];
    
    UIButton *delete = [UIButton buttonWithType:UIButtonTypeCustom];
    _delete = delete;
    delete.backgroundColor = [UIColor blueColor];
    [delete setTitle:@"移除" forState:UIControlStateNormal];
    [delete setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [delete addTarget:self action:@selector(deleteButton) forControlEvents:UIControlEventTouchUpInside];
    [_imageView addSubview:delete];
    [[UIApplication sharedApplication].keyWindow insertSubview:delete aboveSubview:_imageView];
    [delete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView).offset(60);
        make.right.equalTo(_imageView).offset(-150);
        make.width.height.equalTo(@60);
    }];
    ///第一次加载图片
    [[SocketNetworkManager shareInstance]postwithUrl:@"http://wm.sg123456.com/web/index.php?c=order&a=news&do=activity" parameters:nil withBlock:^(NSDictionary *result, NSError *error) {
        if ([result[@"ret"] integerValue] == 200) {
            NSLog(@"图片链接：%@",result);
            NSURL *url = [NSURL URLWithString:result[@"data"][@"purl"]];
            [_imageView sd_setImageWithURL:url];
        }
    }];

}

- (void)deleteButton{
    NSLog(@"点击");
    [_imageView removeFromSuperview];
    [_delete removeFromSuperview];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)connect{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button = button;
    [self.view addSubview:button];
    button.sd_layout.widthIs(60).heightIs(30).rightSpaceToView(self.view, 70).topSpaceToView(self.view, 60);
    [button setTitle:@"连接" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonConnect) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonClose = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonClose = buttonClose;
    [self.view addSubview:buttonClose];
    buttonClose.sd_layout.widthIs(60).heightIs(30).rightSpaceToView(self.view, 10).topSpaceToView(self.view, 60);
    [buttonClose setTitle:@"关闭" forState:UIControlStateNormal];
    [buttonClose setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonClose addTarget:self action:@selector(buttonCloseMethod) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *jiazai = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:jiazai];
    jiazai.sd_layout.widthIs(60).heightIs(30).rightSpaceToView(self.view, 10).topSpaceToView(self.view, 100);
    [jiazai setTitle:@"加载" forState:UIControlStateNormal];
    [jiazai setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [jiazai addTarget:self action:@selector(jiazaiButton) forControlEvents:UIControlEventTouchUpInside];
}
- (void)jiazaiButton{
    WebController *webController = [[WebController alloc]init];
    [self.navigationController pushViewController:webController animated:YES];
}
- (void)buttonConnect{
    self.webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://58.221.65.197:8282"]]];
    self.webSocket.delegate = self;
    self.dataArray = [[NSMutableArray alloc]init];
    [self.webSocket open];
}
- (void)buttonCloseMethod{
//    [_webSocket close];
//    self.webSocket = nil;
//    self.webSocket.delegate = nil;
}
#pragma mark - SRWebSocketDelegate
- (void)webSocketDidOpen:(SRWebSocket *)webSocket;
{
    NSLog(@"open");
    NSData *data = [NSJSONSerialization dataWithJSONObject:@{@"cmd":@"hello",@"uid":@"100",@"uname":@"博"} options:NSJSONWritingPrettyPrinted error:NULL];
    NSString *string = [[ NSString alloc ] initWithData :data encoding : NSUTF8StringEncoding];
    NSLog(@"Websocket Connected");
    [self.view makeToast:@"新的订单" duration:2 position:@"bottom"];
    if (_webSocket) {
        NSLog(@"我是刘博");
        [_webSocket send:string];
    }
}
//- (void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//    [self buttonConnect];
//    NSLog(@"重连");
//}
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error;
{
    NSLog(@":( Websocket Failed With Error %@", error);
//    self.webSocket.delegate = nil;
//    [_webSocket close];
//    [self.view makeToast:@"断网重连" duration:2 position:@"center"];
    ///重连
    [self buttonConnect];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message;
{   NSLog(@"收到的信息：%@", message);
    NSMutableDictionary *dicMessage = [self dictionaryWithJsonString:message];
    NSDictionary *dic = @{@"cmd":@"order",@"result":@{@"shopname":@"北京店铺",@"total_amount":@"60元",@"address":@"中国香港",@"goods":@[@{@"product_id":@"444",@"name":@"矿泉水",@"price":@"12"}]}};
    
    @try {
        if([dicMessage[@"cmd"] isEqualToString:@"order"]){
            //for (NSDictionary *Dic in dicMessage[@"result"][@"goods"]) {
            SocketModel *model = [SocketModel mj_objectWithKeyValues:dicMessage[@"result"]];
            [_dataArray addObject:model];
            _socketTableView.dataArray = _dataArray;
            [_player prepareToPlay];
            [_player play];//播放
            [self.view makeToast:@"您有新的订单" duration:1 position:@"bottom"];
            [self sendNotification];
            
        }
        
    } @catch (NSException *exception) {
        [self.view makeToast:@"异常" duration:1 position:@"bottom"];
    } @finally {
    }
}

- (void)addLocalNotification:(NSString *)string{
    
    
}
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean;
{
    NSLog(@"WebSocket closed");
    //_webSocket = nil;
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload;
{
    NSLog(@"Websocket received pong");
}


-(NSMutableDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if (err) {
        return nil;
    }
    return dic;
}

@end
