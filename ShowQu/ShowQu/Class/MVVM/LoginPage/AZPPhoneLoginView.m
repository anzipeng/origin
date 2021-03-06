//
//  AZPPhoneLoginView.m
//  ShowQu
//
//  Created by Bx on 2019/6/3.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPPhoneLoginView.h"
#import <YYKit/UIView+YYAdd.h>
#import "AZPRegiestOrLoginView.h"

@interface AZPPhoneLoginView()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@property (strong, nonatomic) IBOutlet UIButton *cancleButton;
@property (strong, nonatomic) IBOutlet UIButton *regiestButton;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIView *underLine;
@property (strong, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic,strong) AZPRegiestOrLoginView * regiestView;
@property (nonatomic,strong) AZPRegiestOrLoginView * loginView;
@property (nonatomic,assign) BOOL regiestBackHidden;
@property (nonatomic,assign) BOOL loginBackHidden;
@end
@implementation AZPPhoneLoginView
- (AZPRegiestOrLoginView *)regiestView{
    if (!_regiestView) {
        _regiestView = [AZPRegiestOrLoginView loadNibWithType:PhoneRegiest];
    }
    return _regiestView ;
}
- (AZPRegiestOrLoginView *)loginView{
    if (!_loginView) {
        _loginView = [AZPRegiestOrLoginView loadNibWithType:PhoneLogin];
    }
    return _loginView ;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self initUI];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    @weakify(self);
    [[self.regiestButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self setRegisetButton];
     
        [UIView animateWithDuration:0.5f animations:^{
            [self.contentScrollView setContentOffset:CGPointMake(0, 0)];
        }];
    }];
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self setLoginButton];
        
        [UIView animateWithDuration:.5f animations:^{
            [self.contentScrollView setContentOffset:CGPointMake((kScreenWidth-50), 0)];
        } completion:^(BOOL finished) {
            
        }];
      
    }];
}
- (void) initUI{
    self.regiestBackHidden = YES;
    self.loginBackHidden = YES;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    [self setRegisetButton];
    [self.contentScrollView  setContentSize:CGSizeMake((kScreenWidth-50)*2, 325)];
    [self.contentScrollView  setBounces:NO];
    [self.contentScrollView  setPagingEnabled:YES];
    [self.contentScrollView  setShowsHorizontalScrollIndicator:NO];
    self.contentScrollView.delegate =(id) self;
    self.regiestView.frame = CGRectMake(0, 0, kScreenWidth-50, 325);
    self.loginView.frame = CGRectMake(kScreenWidth-50, 0, kScreenWidth-50, 325);
    [self.contentScrollView addSubview:self.regiestView];
    [self.contentScrollView addSubview:self.loginView];
    [self addSubview:self.contentScrollView];
    [self.regiestView.scrollerOffsetSignal subscribeNext:^(id  _Nullable x) {
        self.backBtn.hidden = NO;
        self.regiestBackHidden =  NO;
    }];
    @weakify(self);
    [[self.backBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.regiestView.contentScrollerView setContentOffset:CGPointMake(0, 0) animated:YES];
        [self.backBtn setHidden:YES];
        self.regiestBackHidden =  YES;
    }];
}
- (void) setRegisetButton{
    [UIView animateWithDuration:.25f animations:^{
        self.underLine.centerX = self.regiestButton.centerX;
        self.backBtn.hidden = self.regiestBackHidden;
    } completion:^(BOOL finished) {
        [self.regiestButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.loginButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }];
  
}
- (void) setLoginButton{
    [UIView animateWithDuration:.25f animations:^{
        self.underLine.centerX = self.loginButton.centerX;
        self.backBtn.hidden = self.loginBackHidden;
    }completion:^(BOOL finished) {
        [self.loginButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.regiestButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }];

}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    if(page == 0)[self setRegisetButton];
    if(page == 1) {
        [self setLoginButton];
        // 重绘子视图的界面
        self.loginView.nameAndPasswordView.forgetBtnWConstant = 75.f;
        self.loginView.nameAndPasswordView.passwordPlacehoder = @"请输入密码";
        [self.loginView.nameAndPasswordView layoutSubviews];
    };
}
@end
