//
//  AZPRegiestOrLoginView.m
//  ShowQu
//
//  Created by Bx on 2019/6/3.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPRegiestOrLoginView.h"
@interface AZPRegiestOrLoginView()
@property (strong, nonatomic) IBOutlet UIView *phoneView;
@property (strong, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIButton *forgetPassword;

@property (strong, nonatomic) IBOutlet UITextField *phoneNum;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *forgetWidth;

@property (strong, nonatomic) IBOutlet UIButton *regiestCode;
@property (strong, nonatomic) IBOutlet UIButton *wechatLogin;
@property (strong, nonatomic) IBOutlet UIButton *QQLogin;
@property (strong, nonatomic) IBOutlet UIButton *sinaLogin;
@property(assign,nonatomic) PhoneRegiestType phoneRegiestType;
@end
@implementation AZPRegiestOrLoginView
+ (AZPRegiestOrLoginView *) loadNibWithType:(PhoneRegiestType)type{
    AZPRegiestOrLoginView * view  = [[[NSBundle mainBundle]loadNibNamed:@"AZPRegiestOrLoginView" owner:self options:nil]lastObject];
    view.phoneRegiestType = type;
    return view;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.phoneView.layer.masksToBounds = YES;
    self.phoneView.layer.cornerRadius = 2;
    self.phoneView.layer.borderWidth = .5f;
    self.phoneView.layer.borderColor = [UIColor blackColor].CGColor;
    self.passwordView.layer.masksToBounds = YES;
    self.passwordView.layer.cornerRadius = 2;
    self.passwordView.layer.borderWidth = .5f;
    self.passwordView.layer.borderColor = [UIColor blackColor].CGColor;
    self.regiestCode.layer.cornerRadius = 2;
    self.regiestCode.layer.masksToBounds = YES;
    self.forgetPassword.titleEdgeInsets = UIEdgeInsetsMake(3,5,3,5);
   
}
- (void)layoutSubviews{
    [super layoutSubviews];
    if(self.phoneRegiestType == PhoneRegiest){
        self.forgetWidth.constant = 0.f;
        [self.regiestCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.phoneNum setPlaceholder:@"密码(至少6位数字或字母)"];
    }
    if(self.phoneRegiestType == PhoneLogin){
        self.forgetWidth.constant = 60.f;
        [self.regiestCode setTitle:@"登录" forState:UIControlStateNormal];
        [self.passWord setPlaceholder:@"请输入密码"];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
