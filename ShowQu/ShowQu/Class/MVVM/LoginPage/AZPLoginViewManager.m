//
//  AZPLoginViewManager.m
//  ShowQu
//
//  Created by 安自鹏 on 2019/6/2.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPLoginViewManager.h"
#import "AZPLoginTypeSelcetView.h"
@interface AZPLoginViewManager()
@property (nonatomic,strong) AZPLoginTypeSelcetView *loginSelectView;
@end
@implementation AZPLoginViewManager

- (AZPLoginTypeSelcetView *)loginSelectView{
    if (!_loginSelectView) {
        _loginSelectView = [[[NSBundle mainBundle]loadNibNamed:@"AZPLoginTypeSelcetView" owner:self options:nil]lastObject];
       
    }
    return _loginSelectView;
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
    if(viewType == LoginViewTypeSelect){
        [self addSubview:self.loginSelectView];
         self.loginSelectView.frame = CGRectMake(25, -400, kScreenWidth-50, 400);
        [UIView animateWithDuration:1 animations:^{
            self.loginSelectView.center = CGPointMake(kScreenWidth/2, kScreenHeight/2);
        } completion:^(BOOL finished) {
        
        }];
    }
    UIWindow * window = [UIApplication sharedApplication].windows[0];
    [window addSubview:self];
}
#pragma mark - 手势点击事件,移除View
- (void)dismissContactView:(UITapGestureRecognizer *)tapGesture{
    
    [self dismissContactView];
}

-(void)dismissContactView
{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1.f animations:^{
        weakSelf.alpha = 0;
        if(self.loginSelectView){
              self.loginSelectView.frame = CGRectMake(25, kScreenHeight+400, kScreenWidth-50, 400);
        }
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
    
}
@end
