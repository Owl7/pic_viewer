//
//  AppDelegate+Category.h
//  picViewer
//
//  Created by 彭益伟 on 5/5/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Category)

/** 把各种初始化操作,固定的操作 写入到类别中 */
- (void)initializeWithApplication:(UIApplication *)application;

@end
