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

#import "AZPUser.h"
@interface AZPRegiestOrLoginView()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *regiestCode;
@property (strong, nonatomic) IBOutlet UIButton *wechatLogin;
@property (strong, nonatomic) IBOutlet UIButton *QQLogin;
@property (strong, nonatomic) IBOutlet UIButton *sinaLogin;
// 类型 注册&&登录
@property(assign,nonatomic) PhoneRegiestType phoneRegiestType;

@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *password;

@property (nonatomic,strong) RACDisposable *disable;

@end
@implementation AZPRegiestOrLoginView
+ (AZPRegiestOrLoginView *) loadNibWithType:(PhoneRegiestType)type{
    AZPRegiestOrLoginView * view  = [[[NSBundle mainBundle]loadNibNamed:@"AZPRegiestOrLoginView" owner:self options:nil]lastObject];
    view.phoneRegiestType = type;
    view.scrollerOffsetSignal = [RACSubject subject];
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
        _nameAndPasswordView = [AZPNameAndPasswrd loadView];
    }
    return _nameAndPasswordView;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self initUI];
    [self subviewsFuction];
    [self.contentScrollerView addSubview:self.nameAndPasswordView];
    [self.contentScrollerView addSubview:self.regiestCodeView];
    
    self.nameAndPasswordView.frame = CGRectMake(0, 0, kScreenWidth-50, 150);
    self.regiestCodeView.frame = CGRectMake(kScreenWidth-50, 0, kScreenWidth-50, 150);
}
- (void)layoutSubviews{
    [super layoutSubviews];
 
    if(self.phoneRegiestType == PhoneRegiest){
        if(self.contentScrollerView.contentOffset.x == 0){
            [self.regiestCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        }
        if(self.contentScrollerView.contentOffset.x == (kScreenWidth-50)){
            [self.regiestCode setTitle:@"注册" forState:UIControlStateNormal];
        }
    }
    if(self.phoneRegiestType == PhoneLogin){
        [self.regiestCode setTitle:@"登录" forState:UIControlStateNormal];
    }
}
- (void) subviewsFuction{
    //注册逻辑
    @weakify(self);
    if(self.phoneRegiestType == PhoneRegiest){
        // 注册界面1
        if(self.contentScrollerView.contentOffset.x ==0 ){
            [[RACSignal combineLatest:@[self.nameAndPasswordView.phoneNumTextField.rac_textSignal,self.nameAndPasswordView.passwordTextField.rac_textSignal] reduce:^id _Nonnull(NSString * userName,NSString *passWord){
                @strongify(self);
                self.username = userName;
                self.password = passWord;
                return @(userName.length>0 && passWord.length>0);
            }] subscribeNext:^(id  _Nullable x) {
                NSNumber* y = (NSNumber *)x;
                self.regiestCode.enabled = y.boolValue;
            }];
        [[self.regiestCode rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x){
                @strongify(self);
                // 跳转到验证码界面
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
                }else{
                    [self.contentScrollerView setContentOffset:CGPointMake(kScreenWidth-50, 0) animated:YES];
                    
                    [self.scrollerOffsetSignal sendNext:@(NO)];
                    //开启倒计时
                    [self.regiestCodeView timeCountDownWithPhoneNum:self.username];
                    
                }
            }];
        }
        // 注册界面2
        if(self.contentScrollerView.contentOffset.x == (kScreenWidth-50)){
         
            [[self.regiestCodeView.regiestCodeTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
                return @(value.length>0);
            }]subscribeNext:^(id  _Nullable x) {
                @strongify(self);
                NSNumber* y = (NSNumber *)x;
                self.regiestCode.enabled = y.boolValue;
               
            }];
            [[self.regiestCode rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x){
                @strongify(self);
                [self.regiestCodeView.regiestCodeTextField setText:@""];
                User * user = [[User alloc]init];
                user.userName = self.username;
                user.password = self.password;
                [AZPUser setUserSigle:[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                    [subscriber sendNext:user];
                    NSLog(@"x = %@ ,= %@",user.userName,user.password);
//                    [[[UIAlertView alloc]initWithTitle:@"提示" message:@"注册完成，请登录！" delegate:self cancelButtonTitle:nil otherButtonTitles:@"好的", nil] show];
//                    [[[AZPUser getCurrentUserCommand]execute:nil]subscribeNext:^(id  _Nullable x) {
//                        NSArray * users  = (NSArray *)x;
//                        for (User *user in users) {
//
//                        }
//
//                    }];
                    return nil;
                }]];
                
            }];
        }
    }
    
    if(self.phoneRegiestType == PhoneLogin){
      
    }
}

- (void) initUI{
    self.regiestCode.layer.cornerRadius = 2;
    self.regiestCode.layer.masksToBounds = YES;
    [self.contentScrollerView  setContentSize:CGSizeMake((kScreenWidth-50)*2, 150)];
    [self.contentScrollerView  setBounces:NO];
    [self.contentScrollerView  setScrollEnabled:NO];
    [self.contentScrollerView  setPagingEnabled:YES];
    [self.contentScrollerView  setShowsHorizontalScrollIndicator:NO];
    self.contentScrollerView.delegate =(id) self;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.x == 0||scrollView.contentOffset.x == (kScreenWidth-50)){
       [self subviewsFuction];
       [self layoutSubviews];
    }
}
@end
