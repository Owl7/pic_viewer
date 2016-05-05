//
//  NSObject+HUD.h
//  picViewer
//
//  Created by 彭益伟 on 5/5/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MBProgressHUD.h>

@interface NSObject (HUD)

/** 弹出文字提示 */
- (void)showAlert:(NSString *)text;
/** 显示忙 */
- (void)showBusy;
/** 隐藏提示 */
- (void)hideProgress;
@end











