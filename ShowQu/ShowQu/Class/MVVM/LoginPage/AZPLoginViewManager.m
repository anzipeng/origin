//
//  AZPLoginViewManager.m
//  ShowQu
//
//  Created by 安自鹏 on 2019/6/2.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPLoginViewManager.h"
#import "AZPLoginTypeSelcetView.h"
#import "AZPPhoneLoginView.h"
#import <YYKit/UIView+YYAdd.h>

@interface AZPLoginViewManager()
@property (nonatomic,strong) AZPLoginTypeSelcetView *loginSelectView;
@property (nonatomic,strong) AZPPhoneLoginView *phoneLoginView;

@end
@implementation AZPLoginViewManager

- (AZPLoginTypeSelcetView *)loginSelectView{
    if (!_loginSelectView) {
        _loginSelectView = [[[NSBundle mainBundle]loadNibNamed:@"AZPLoginTypeSelcetView" owner:self options:nil]lastObject];
    }
    return _loginSelectView;
}
- (AZPPhoneLoginView *)phoneLoginView{
    if (!_phoneLoginView) {
        _phoneLoginView = [[[NSBundle mainBundle]loadNibNamed:@"AZPPhoneLoginView" owner:self options:nil]lastObject];
    }
    return _phoneLoginView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutAllSubviews];
    }
    return self;
}

- (void)layoutAllSubviews{
    UIView *bgView = [[UIView alloc] initWithFrame:self.frame];
    bgView.alpha = 0.8;
    bgView.backgroundColor = [UIColor blackColor];
    [self addSubview:bgView];
    // 添加手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissContactView:)];
    [bgView addGestureRecognizer:tapGesture];
}
- (void)showLoginTypeView:(LoginViewType)viewType{
    for (UIView* view in self.subviews) {
        if([view isKindOfClass:[AZPPhoneLoginView class]]){
            [self.phoneLoginView removeFromSuperview];
            self.phoneLoginView = nil;
        }
        if([view isKindOfClass:[AZPLoginTypeSelcetView class]]){
            [self.loginSelectView removeFromSuperview];
            self.loginSelectView = nil;
        }
    }
    if(viewType == LoginViewTypeSelect){
        [self addSubview:self.loginSelectView];
         self.loginSelectView.frame = CGRectMake(25, -400, kScreenWidth-50, 400);
        [UIView animateWithDuration:.6f animations:^{
            self.loginSelectView.centerY = kScreenHeight/2;
            [[self.loginSelectView.phoneLogin rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
                NSLog(@"点击了按钮");
                [self dismiss:NO];
               
            }];
        } completion:^(BOOL finished) {
           
        }];
    }
    if(viewType == LoginViewTypePhone){
        [self addSubview:self.phoneLoginView];
        self.phoneLoginView.frame = CGRectMake(25, -400, kScreenWidth-50, 400);
        [UIView animateWithDuration:.6f animations:^{
            self.phoneLoginView.centerY = kScreenHeight/2;
        } completion:^(BOOL finished) {
            
        }];
    }
    UIWindow * window = [UIApplication sharedApplication].windows[0];
    [window addSubview:self];
}
#pragma mark - 手势点击事件,移除View
- (void)dismissContactView:(UITapGestureRecognizer *)tapGesture{
    [self dismiss:YES];
}
-(void)dismiss:(BOOL) dismiss;
{
    
    [UIView animateWithDuration:.6f animations:^{
        if(self.loginSelectView){
              self.loginSelectView.centerY = kScreenHeight+400;
        }
        if(self.phoneLoginView){
            self.phoneLoginView.centerY = kScreenHeight+400;
        }
    } completion:^(BOOL finished) {
        
        if(dismiss){
            [self removeFromSuperview];
        }else{
            [self showLoginTypeView:LoginViewTypePhone];
        }
    }];
    
}
- (void)dismiss{
    [self removeFromSuperview];
}
@end
