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

@property (strong, nonatomic) IBOutlet UITextField *phoneNum;
@property (strong, nonatomic) IBOutlet UITextField *passWord;

@property (strong, nonatomic) IBOutlet UIButton *regiestCode;
@property (strong, nonatomic) IBOutlet UIButton *wechatLogin;
@property (strong, nonatomic) IBOutlet UIButton *QQLogin;
@property (strong, nonatomic) IBOutlet UIButton *sinaLogin;

@end
@implementation AZPRegiestOrLoginView
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
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
