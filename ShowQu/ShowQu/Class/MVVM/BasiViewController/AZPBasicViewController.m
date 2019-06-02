//
//  AZPBasicViewController.m
//  ShowQu
//
//  Created by Bx on 2019/5/30.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPBasicViewController.h"
#import "AZPLoginView.h"
#import "AZPLoginViewManager.h"
@interface AZPBasicViewController ()
@property (nonatomic,strong) AZPLoginView *loginView;
@property (nonatomic,strong) AZPLoginViewManager *loginViewManager;

@property (nonatomic,strong) UIView * modalView;
@end

@implementation AZPBasicViewController
- (AZPLoginViewManager *)loginViewManager{
    if (!_loginViewManager) {
        _loginViewManager = [[AZPLoginViewManager alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
      
    }
    return _loginViewManager;
}
- (UIView *)loginView{
    if(_loginView == nil){
        _loginView = [[[NSBundle mainBundle]loadNibNamed:@"AZPLoginView" owner:self options:nil]lastObject];
        _loginView.frame = self.view.frame;
    }
    return _loginView;
}

- (UIView *)modalView{
    if (!_modalView) {
        _modalView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _modalView.backgroundColor =  [UIColor colorWithWhite:0.f alpha:0.5];
    }
    return _modalView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [[[AZPUser getCurrentUserCommand] execute:nil]subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
        if([x isKindOfClass:[NSString class]] && [x isEqualToString:@"no_user_login"]){
            // 没有存储用户账号 添加登录界面
            [self.navigationController setNavigationBarHidden:YES];
            [self.view addSubview:self.loginView];
            [self.view bringSubviewToFront:self.loginView];
            @weakify(self);
            [[self.loginView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
                @strongify(self);
                [self.view addSubview:self.loginViewManager];
                [self.loginViewManager setAlpha:1.0];
                [self.loginViewManager showLoginTypeView:LoginViewTypeSelect];
            }];
        }
        if([x isKindOfClass:[User class]]){
            [self.navigationController setNavigationBarHidden:NO];
            [self loadDataWithUser:(User *)x];
        }
      
    }];
}
- (void) loadDataWithUser:(User *)user{
    //空实现
}
@end
