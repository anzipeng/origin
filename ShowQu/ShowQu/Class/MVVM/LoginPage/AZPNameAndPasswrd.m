//
//  AZPNameAndPasswrd.m
//  ShowQu
//
//  Created by Bx on 2019/6/4.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPNameAndPasswrd.h"
@interface AZPNameAndPasswrd()

@property (strong, nonatomic) IBOutlet UIView *phoneNumView;

@property (strong, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *forgrtPasswordBtn;
@property (strong, nonatomic) IBOutlet UIView *passwordView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *forgetBtnWidthConstant;


@property (nonatomic,copy) NSString *passwordPlaceHolder;
@property (nonatomic,assign) float forgetBtnConstant;
@end
@implementation AZPNameAndPasswrd
- (instancetype)initWithFrame:(CGRect)frame{
   self =  [super initWithFrame:frame];
    NSLog(@"a");
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self initUI];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.passwordTextField setPlaceholder:self.passwordPlaceHolder];
     self.forgetBtnWidthConstant.constant = self.forgetBtnConstant;
}
+ (AZPNameAndPasswrd *)loadViewWithPasswordContent:(NSString *)passwordContent forgetBtnWidthConstant:(float)fconstant{
    AZPNameAndPasswrd * view = [[[NSBundle mainBundle]loadNibNamed:@"AZPNameAndPasswrd" owner:self options:nil]lastObject];
    view.forgetBtnConstant = fconstant;
    view.passwordPlaceHolder = passwordContent;
    return view;
}
- (void) initUI{
    self.phoneNumView.layer.masksToBounds = YES;
    self.phoneNumView.layer.cornerRadius = 2;
    self.phoneNumView.layer.borderWidth = .5f;
    self.phoneNumView.layer.borderColor = [UIColor blackColor].CGColor;
    self.passwordView.layer.masksToBounds = YES;
    self.passwordView.layer.cornerRadius = 2;
    self.passwordView.layer.borderWidth = .5f;
    self.passwordView.layer.borderColor = [UIColor blackColor].CGColor;
}

@end
