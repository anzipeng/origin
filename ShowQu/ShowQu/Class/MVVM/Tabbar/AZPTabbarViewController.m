//
//  AZPTabbarViewController.m
//  ShowQu
//
//  Created by Bx on 2019/5/28.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPTabbarViewController.h"
#import "AZPNavigationViewController.h"
#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
#define kThemeColor [UIColor colorWithRed:(26 / 255.0) green:(26 / 255.0) blue:(26 / 255.0) alpha:1]
@interface AZPTabbarViewController ()

@end

@implementation AZPTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"AZPMyBookMarkViewController",
                                   kTitleKey  : @"我的书签",
                                   kImgKey    : @"tab_mark",
                                   kSelImgKey : @"tab_mark_selected"},
                                 
                                 @{kClassKey  : @"AZPDiscoveryViewController",
                                   kTitleKey  : @"发现",
                                   kImgKey    : @"tab_discovery",
                                   kSelImgKey : @"tab_discovery_selected"},
                                 
                                 @{kClassKey  : @"AZPAttentionViewController",
                                   kTitleKey  : @"关注",
                                   kImgKey    : @"tab_follow",
                                   kSelImgKey : @"tab_follow_selected"},
                                 
                                 @{kClassKey  : @"AZPMeViewController",
                                   kTitleKey  : @"我",
                                   kImgKey    : @"tab_personal",
                                   kSelImgKey : @"tab_personal_selected"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        AZPNavigationViewController *nav = [[AZPNavigationViewController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : kThemeColor} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    self.selectedIndex = 0;
}

@end
