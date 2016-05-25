//
//  AppDelegate.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "loginXib.h"
#import "KeyboardManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setIQKeyBoardManager];
//    MainViewController *mainController = [[MainViewController alloc]init];
//    self.window.rootViewController = mainController;
    loginXib *loginCtrol = [[loginXib alloc]init];
    self.window.rootViewController = loginCtrol;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    return YES;
}

//设置防键盘遮挡
- (void)setIQKeyBoardManager{
   
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;

}

- (void)applicationWillResignActive:(UIApplication *)application {
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
