//
//  AZPwelcomViewController.m
//  ShowQu
//
//  Created by Bx on 2019/5/27.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPwelcomViewController.h"
@interface AZPwelcomViewController ()

@end

@implementation AZPwelcomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.welcomView = [[DHGuidePageHUD alloc]dh_initWithFrame:[UIScreen mainScreen].bounds imageNameArray:@[@"unlogin1",@"unlogin2",@"unlogin3",@"unlogin4",@"unlogin5"] buttonIsHidden:NO];
    [self.view addSubview:self.welcomView];
    
}
@end
