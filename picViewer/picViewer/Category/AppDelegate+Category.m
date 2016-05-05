//
//  AppDelegate+Category.m
//  picViewer
//
//  Created by 彭益伟 on 5/5/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "AppDelegate+Category.h"
// 电池条上网络活动提示(菊花转动)
#import <AFNetworkActivityIndicatorManager.h>

@implementation AppDelegate (Category)

- (void)initializeWithApplication:(UIApplication *)application {
// 注册DDLog
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
// 当使用AF发送网络请求时, 只要有网络操作, 那么在状态栏(电池条)WiFi符号旁边显示菊花提示
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
// 能够检测当前网络是WiFi，蜂窝，没有网
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
// 网络发生变化时触发
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                DDLogVerbose(@"当前是wifi环境");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                DDLogVerbose(@"当前无网络");
                break;
            case AFNetworkReachabilityStatusUnknown:
                DDLogVerbose(@"当前网络未知");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                DDLogVerbose(@"当前是蜂窝网络");
                break;
                
            default:
                break;
        }
    }];
// 开启网络检测
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
// 网络活动发生变化时,会发送下方key 的通知,可以在通知中心中添加检测
// AFNetworkingReachabilityDidChangeNotification
    /*
    [[NSNotificationCenter defaultCenter] addObserver:nil selector:nil name:AFNetworkingReachabilityDidChangeNotification object:nil];
    */
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"000000000000000000");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
}












@end
