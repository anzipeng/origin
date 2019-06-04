//
//  AZPRegiestOrLoginView.m
//  ShowQu
//
//  Created by Bx on 2019/6/3.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPRegiestOrLoginView.h"
#import <YYKit/NSString+YYAdd.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "NSString+AZPExtension.h"
#import "AZPRegiestCode.h"
#import "AZPNameAndPasswrd.h"
@interface AZPRegiestOrLoginView()<UIScrollViewDelegate>

@property (nonatomic,strong) AZPRegiestCode * regiestCodeView;
@property (nonatomic,strong) AZPNameAndPasswrd *nameAndPasswordView;

@property (strong, nonatomic) IBOutlet UIScrollView *contentScrollerView;

@property (strong, nonatomic) IBOutlet UIButton *regiestCode;
@property (strong, nonatomic) IBOutlet UIButton *wechatLogin;
@property (strong, nonatomic) IBOutlet UIButton *QQLogin;
@property (strong, nonatomic) IBOutlet UIButton *sinaLogin;
// 类型 注册&&登录
@property(assign,nonatomic) PhoneRegiestType phoneRegiestType;

@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *password;
@end
@implementation AZPRegiestOrLoginView
+ (AZPRegiestOrLoginView *) loadNibWithType:(PhoneRegiestType)type{
    AZPRegiestOrLoginView * view  = [[[NSBundle mainBundle]loadNibNamed:@"AZPRegiestOrLoginView" owner:self options:nil]lastObject];
    view.phoneRegiestType = type;
    return view;
}
- (AZPRegiestCode *)regiestCodeView{
    if(!_regiestCodeView){
        _regiestCodeView = [AZPRegiestCode loadView];
    }
    return _regiestCodeView;
}
- (AZPNameAndPasswrd *)nameAndPasswordView{
    if(!_nameAndPasswordView){
        if(self.phoneRegiestType == PhoneRegiest){
        _nameAndPasswordView = [AZPNameAndPasswrd loadViewWithPasswordContent:@"密码(至少6位数字或字母)" forgetBtnWidthConstant:0.f];
        }
        if(self.phoneRegiestType == PhoneLogin){
            _nameAndPasswordView = [AZPNameAndPasswrd loadViewWithPasswordContent:@"请输入密码" forgetBtnWidthConstant:75.f];
        }
    }
    return _nameAndPasswordView;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self initUI];
    [self subviewsFuction];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    if(self.phoneRegiestType == PhoneRegiest){
        [self.regiestCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    if(self.phoneRegiestType == PhoneLogin){
        [self.regiestCode setTitle:@"登录" forState:UIControlStateNormal];
    }
}
- (void) subviewsFuction{
    if(self.phoneRegiestType == PhoneRegiest){
        //注册逻辑
        @weakify(self);
//        RAC(self.regiestCode,enabled) = [RACSignal combineLatest:@[self.phoneNum.rac_textSignal,self.passWord.rac_textSignal] reduce:^id _Nonnull(NSString * userName,NSString *passWord){
//            @strongify(self);
//            self.username = userName;
//            self.password = passWord;
//            return @(userName.length>0 && passWord.length>0);
//        }];
        
        [[self.regiestCode rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            NSString * infoStr = @"";
            if([self.username isNotBlank] && self.username.length != 11){
                    infoStr = @"电话号码长度应为11位！";
                }
            if([self.username isNotBlank] && self.username.length == 11 && ![NSString validateContactNumber:self.username]){
                    infoStr = @"请输入正确的手机号！";
                }
            if([self.password isNotBlank] && self.password.length<6){
                   infoStr =  @"至少6位数字或字母！";
                }
            if(infoStr.length>0){
                [[[UIAlertView alloc]initWithTitle:@"提示" message:infoStr delegate:self cancelButtonTitle:nil otherButtonTitles:@"好的", nil] show];
                return ;
            }
            
               
            }];
    }else{
        //登录逻辑
    }
   
}
- (void) initUI{
    self.regiestCode.layer.cornerRadius = 2;
    self.regiestCode.layer.masksToBounds = YES;
    [self.contentScrollerView  setContentSize:CGSizeMake((kScreenWidth-50)*2, 325)];
    [self.contentScrollerView  setBounces:NO];
    [self.contentScrollerView  setPagingEnabled:YES];
    [self.contentScrollerView  setShowsHorizontalScrollIndicator:NO];
    self.contentScrollerView.userInteractionEnabled = NO;
    self.contentScrollerView.delegate =(id) self;
    self.nameAndPasswordView.frame = CGRectMake(0, 0, kScreenWidth-50, 150);
    self.regiestCodeView.frame = CGRectMake(kScreenWidth-50, 0, kScreenWidth-50, 150);
    [self.contentScrollerView addSubview:self.nameAndPasswordView];
    [self.contentScrollerView addSubview:self.regiestCodeView];
}

@end
