//
//  AppDelegate.m
//  ShowQu
//
//  Created by Bx on 2019/5/27.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AppDelegate.h"
#import "AZPUser.h"
#import "AZPwelcomViewController.h"
#import "AZPTabbarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self configShowPage];
    return YES;
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
- (void) configShowPage{
    [[[AZPUser isFirstLoginCommand]execute:nil]subscribeNext:^(id  _Nullable x) {
        // 第一次登录，跳转引导页
        if([x boolValue] == YES){
            AZPwelcomViewController * welPageVc = [[AZPwelcomViewController alloc]init];
            self.window.rootViewController = welPageVc;
            [[[NSNotificationCenter defaultCenter]rac_addObserverForName:WelcomPageCompleteNotifaction object:nil]subscribeNext:^(NSNotification * _Nullable x) {
                NSLog(@"点击了按钮");
                //跳转登录界面
                AZPTabbarViewController * taberVc = [[AZPTabbarViewController alloc]init];
                self.window.rootViewController = taberVc;
            
            }];
            
        }else{
            NSLog(@"++++++++++++");
        }
        
      
      
        [self.window makeKeyAndVisible];
    } error:^(NSError * _Nullable error) {
        
    }];
}

@end
