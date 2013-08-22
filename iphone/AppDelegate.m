//
//  AppDelegate.m
//  viewFirst
//
//  Created by 杨 国旗 on 13-8-8.
//  Copyright (c) 2013年 cpic.wondertek.cpic. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "WebViewController.h"
#import "SystemCoreProfile.h"
#import "StringUtil.h"
#import "ConnectedToNetwork.h"
#import "ASIHTTPRequest.h"
#import "GDataXMLNode.h"

@implementation AppDelegate

@synthesize cacheFileURLDictionary=_cacheFileURLDictionary;

- (void)getDeviceAndOtherInfo
{
    //获取设备的udid
    NSString *uuid = [[UIDevice currentDevice] uniqueIdentifier];
    NSLog(@"uuid=====%@",uuid);
    
}

- (void)testXml
{ 
    //获取工程目录的xml文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"notification" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //使用NSData对象初始化
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData  options:0 error:nil];
    
    //获取根节点（Users）
    GDataXMLElement *rootElement = [doc rootElement];
    
    //<item identify="001" market="" key="user001" saleType="type001" credit="杨国旗">龙虾</item>
    
    //获取根节点下的节点（User）
    NSArray *infos = [rootElement elementsForName:@"info"];
    GDataXMLElement *myInfo = [infos objectAtIndex:0];
    // 获取name节点的值
    NSString *infoname = [myInfo stringValue];
    NSLog(@"myInfo nodeNameValue is:%@",infoname);
    
    //获取根节点下的节点（User）
    NSArray *items = [rootElement elementsForName:@"items"];
    GDataXMLElement *item = [items objectAtIndex:0];
    NSArray *itemNodes = [item elementsForName:@"item"];
    for (GDataXMLElement *node in itemNodes) {
        NSString *identify = [[node attributeForName:@"identify"] stringValue];
        NSLog(@"item identify is:%@",identify);
    
        NSString *key = [[node attributeForName:@"key"] stringValue];
        NSLog(@"item key is:%@",key);
    
        // 获取name节点的值
        NSString *name = [node stringValue];
        NSLog(@"item name is:%@",name);
    } 
}

- (void)test
{
    NSDateFormatter *dateFormatter=[NSDateFormatter new];
    // 24小时时间
    [dateFormatter setDateFormat:DATEFORMAT24];
    
    NSDate *date1=[StringUtil dateString2Date:@"2012-03-04 12:23:03" dateFormat:dateFormatter];
    NSDate *date2=[StringUtil dateString2Date:@"2013-03-04 12:23:03" dateFormat:dateFormatter];
    
    [date2 dateByAddingTimeInterval:20];
    if([date1 compare:date2] == NSOrderedAscending){
        
    }
    if([date1 compare:date2] == NSOrderedAscending){
        
    }
    
    NSString *urlPath=@"http://192.168.1.3:8080/xone-app/assistant/subscribe.html?id=2&_m=B99FD091ACED234EB4FA35CDA17FD448";
    
    NSURL *url = [NSURL URLWithString:urlPath];
    
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    //使用OC中新增的bolck语法（块语法），可以实现并行编程
    //以下方法是在请求完成后会被调用的块
    [request setCompletionBlock:^{
        //获取请求返回结果
        NSString *response = [request responseString];
         NSLog(@"response ==== %@",response);
        //GDataXMLNode *xmlParse=[GDataXMLNode textWithStringValue:response];
        
        GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithXMLString:response options:0 error:nil];
        GDataXMLElement *root = [xmlDoc rootElement];
        NSArray *array = [root children];
        NSLog(@"count : %d", [array count]);
 
        //获取根节点下的节点（User）
        NSArray *info = [root elementsForName:@"info"];
        for(GDataXMLElement *user in info) {
            //User节点的id属性
//            NSString *userId = [[user attributeForName:@"id"] stringValue];
//            NSLog(@"User id is:%@",userId);
            
            //获取name节点的值
            GDataXMLElement *nameElement = [[user elementsForName:@"titile"] objectAtIndex:0];
            NSString *titile = [nameElement stringValue];
            NSLog(@"info->title is:%@",titile);
        }
        
        //如果是数据集，可以使用以下方式返回结果
        //        NSData *responseData = [request responseData];
        
    }];
    
    //如果请求失败，可以在这里进行处理
    [request setFailedBlock:^{
        //        NSError *error = [request error];
        
    }];
    
    //开启一个异步请求（这里只说明了异步请求的使用，因为一般情况下的网络请求都采用异步的方式，否则会阻塞UI）
    [request startAsynchronous];
  
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 应用启动时取消所有通知
    //[self cancelLocalNotification];
    [self testXml];
    [self getDeviceAndOtherInfo];
    NSLog(@"AppDelegate start.....");

    application.applicationIconBadgeNumber = 0;
    //开启iphone网络开关
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    // 登录用户信息 user_id 和设备号
    NSUserDefaults *shareNotifications = [NSUserDefaults standardUserDefaults];
    [shareNotifications setValue:@"2" forKey:USER_LOGIN_ID];
    [shareNotifications setValue:@"B99FD091ACED234EB4FA35CDA17FD448" forKey:DEVICE_ID];
    [shareNotifications synchronize];

       
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.viewController = [[WebViewController alloc] initWithNibName:@"LoadRemoteHtml" bundle:nil];
  
    self.window.rootViewController = self.viewController;
   
    [self.window makeKeyAndVisible];
    
   
    
    // 测试时 没小时执行一次 项目实际每天执行一次
    //[NSTimer scheduledTimerWithTimeInterval:TIME_INTERVAL target:self selector:@selector(createLocalNotificationInfo) userInfo:nil repeats:YES];
    
    // 模拟数据库数据 没小时增加2条记录
    [NSTimer scheduledTimerWithTimeInterval:TIME_INTERVAL_HALF target:self selector:@selector(fullLocalNotificationRecords) userInfo:nil repeats:YES];

    return YES;
}

- (void)notificationTimer
{
    //判断网络是否联通
    if([[NSString stringWithFormat:@"%i",[[ConnectedToNetwork new] connectedToNetwork]] isEqualToString:@"1"])
    {
        NSLog(@"网络连接良好");
        
        
    }else{
        NSLog(@"网络无法连接");
    }

    
}

# pragma mark -
# pragma mark 半小时填充2条模拟数据到通知信息中
- (void)fullLocalNotificationRecords
{
    NSUserDefaults *shareNotifications = [NSUserDefaults standardUserDefaults];
    //从内存中取出记录
    
    // 初始化可变数组 相当于java众ArrayList对象
    //NSMutableArray *arr=[NSMutableArray new];
    NSString *id=[NSString stringWithFormat:@"100%zi",(arc4random() % 10000)];
    NSDictionary *dictionary =[NSDictionary dictionaryWithObjectsAndKeys:
                               id,@"id"
                               ,@"杨国旗",@"userName"
                               ,@"这是我的通知信息body，请点击，会自动跳转到页面",@"context"
                               ,@"usernotifi",@"notificationType"
                               ,nil];
    
//    [dictionary setValue:id forKey:@"id"];// 设置信息主键
//    [dictionary setValue:@"杨国旗" forKey:@"userName"];
//    [dictionary setValue:@"这是我的通知信息body，请点击，会自动跳转到页面" forKey:@"context"];
//    [dictionary setValue:@"usernotifi" forKey:@"notificationType"];//通知类型为用户自定义
       
//    dictionary =[NSMutableDictionary new];
//    id=[NSString stringWithFormat:@"100%zi",(arc4random() % 10000)];
//    [dictionary setValue:id forKey:@"id"];// 设置信息主键
//    [dictionary setValue:@"胡总" forKey:@"userName"];
//    [dictionary setValue:@"这是我的通知信息body2，请点击，会自动跳转到页面" forKey:@"context"];
//    [dictionary setValue:@"usernotifi" forKey:@"notificationType"];//通知类型为用户自定义
    
    id=[NSString stringWithFormat:@"100%zi",(arc4random() % 10000)];
    NSDictionary *dictionary2 =[NSDictionary dictionaryWithObjectsAndKeys:
                 id,@"id"
                 ,@"胡总",@"userName"
                 ,@"这是我的通知信息body222，请点击，会自动跳转到页面",@"context"
                 ,@"usernotifi",@"notificationType"
                 ,nil];
    
    NSArray *shareArr= [NSArray arrayWithObjects:dictionary,dictionary2, nil];
    
    //添加新记录到老记录中
    [shareNotifications setObject:shareArr forKey:SHARE_NOTIFICATIONS];
    NSLog(@"full records==== count=%zi",[shareArr count]);
    [shareNotifications synchronize];
    
//    NSString *val=nil;
//    
//    for(NSObject *obj in arr)
//    {
//        val=[obj valueForKey:@"userName"];
//        NSLog(@"%@",val);
//    }
}


- (void)createLocalNotificationInfo
{
    NSLog(@"开始调用createLocalNotificationInfo函数");
    // 创建一个本地推送
    UILocalNotification *notification = nil;
    //设置10秒之后
    NSDate *pushDate = [NSDate dateWithTimeIntervalSinceNow:10];
    
    NSUserDefaults *shareUserMap = [NSUserDefaults standardUserDefaults];
    NSArray *mutableArr=[shareUserMap valueForKey:SHARE_NOTIFICATIONS];
    for(NSDictionary *objUserInfo in mutableArr)
    {
        notification = [UILocalNotification new];
        [self setOneRecordNotifiction:notification pushDate:pushDate userInfo:objUserInfo];
    }
    //记录本次推送的时间
  
    NSDateFormatter *dateFormatter=[NSDateFormatter new];
    // 24小时时间
    [dateFormatter setDateFormat:DATEFORMAT24];
    //获取当前时间
    NSDate *dateNow = [NSDate date];
    NSString *currentDateStr=[StringUtil date2DateString:dateNow dateFormat:dateFormatter];
    [shareUserMap setObject:currentDateStr forKey:TIME_INTERVAL_NAME];
    [shareUserMap synchronize];
    
    NSString *strDate=[shareUserMap valueForKey:TIME_INTERVAL_NAME];
    NSLog(@"%@",strDate);
    
}

# pragma mark 创建本地通知 设置一条记录
- (void)setOneRecordNotifiction:(UILocalNotification *)notification pushDate:(NSDate *)pushDate userInfo:(NSDictionary *)userInfo
{
    if (notification != nil) {
        // 设置推送时间
        notification.fireDate = pushDate;
        // 设置时区
        notification.timeZone = [NSTimeZone defaultTimeZone];
        // 设置重复间隔 kCFCalendarUnitDay 每天执行一次 0代表不重复
        notification.repeatInterval = 0;
        // 推送声音
        notification.soundName = UILocalNotificationDefaultSoundName;

        // 推送内容
        notification.alertBody = [userInfo valueForKey:@"context"];
        
        //[NSString stringWithFormat:@"推送内容  %i", (arc4random() % 100)];
        
        notification.alertAction = NSLocalizedString(@"显示的推送信息", nil);
        notification.hasAction=YES;
        
        //显示在icon上的红色圈中的数子
        //notification.applicationIconBadgeNumber += 1;
        
        //设置userinfo 方便在之后需要撤销的时候使用
        NSDictionary *info = [NSDictionary dictionaryWithObject:@"1002" forKey:@"usernotification"];
        notification.userInfo = userInfo;
        //添加推送到UIApplication
        UIApplication *app = [UIApplication sharedApplication];
        app.applicationIconBadgeNumber += 1;
        [app scheduleLocalNotification:notification];
        
    }
}

- (void)cancelLocalNotification
{
    // 获得 UIApplication
    UIApplication *app = [UIApplication sharedApplication];
    //获取本地推送数组
    NSArray *localArray = [app scheduledLocalNotifications];
    //声明本地通知对象
    UILocalNotification *localNotification;
    if (localArray) {
        for (UILocalNotification *noti in localArray) {
            NSDictionary *dict = noti.userInfo;
            if (dict) {
                app.applicationIconBadgeNumber -= 1;
                [app cancelLocalNotification:noti];
                NSLog(@"id=%@",[dict valueForKey:@"id"]);
//                NSString *inKey = [dict objectForKey:@"notificationType"];
//                if ([inKey isEqualToString:@"usernotifi"]) {
//                    if (localNotification){
//                        localNotification = nil;
//                    }
//                    localNotification = noti;
//                    break;
//                }
            }
        }
    }
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification*)localNotification{
     NSLog(@"usernotification  didReceiveLocalNotification start");
    
    if(localNotification != nil && application.applicationState == UIApplicationStateActive){
        NSDictionary  *dict = localNotification.userInfo;
        if (dict) {
            NSString *inValue = [dict objectForKey:@"notificationType"];
            if(inValue != nil && [inValue isEqualToString:@"usernotifi"]){
                NSLog(@"usernotification  didReceiveLocalNotification method");
                application.applicationIconBadgeNumber -= 1;
                localNotification = nil;
                WebViewController *webViewController = self.viewController;
                
                NSURL *url =[NSURL URLWithString:@"http://www.baidu.com"];
                NSURLRequest *request =[NSURLRequest requestWithURL:url];
                [webViewController.webView loadRequest:request];
            }
        }

    }
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary*)dict
{
    NSLog(@"remote   didReceiveRemoteNotification======= sta");
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
