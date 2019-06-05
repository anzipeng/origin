//
//  AZPRegiestCode.m
//  ShowQu
//
//  Created by Bx on 2019/6/4.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPRegiestCode.h"
@interface AZPRegiestCode()

@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic) IBOutlet UILabel *replayGetRegiestCode;
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;

@property (nonatomic,strong) UIGestureRecognizer *gecognizer;
@property (nonatomic,strong) RACDisposable *disposable;

@property (nonatomic,copy) NSString *phoneNum;
@end

@implementation AZPRegiestCode
+ (AZPRegiestCode *)loadView{
    return [[[NSBundle mainBundle]loadNibNamed:@"AZPRegiestCode" owner:self options:nil]lastObject];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self initUI];
  
}
- (void)layoutSubviews{
    [super layoutSubviews];
 
}
- (void) initUI{
    self.timeCountDownCompleteSignal = [RACSubject subject];
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 2;
    self.contentView.layer.borderWidth = .5f;
    self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(timeCountDown)];
    [self.replayGetRegiestCode addGestureRecognizer:ges];
    [self.replayGetRegiestCode setUserInteractionEnabled:YES];
  
}
// 倒计时
- (void) timeCountDown{
    [self timeCountDownWithPhoneNum:self.phoneNum];
}
- (void) timeCountDownWithPhoneNum:(NSString *)phoneNum{
    if(self.disposable){
        [self.disposable dispose];
    }
    self.phoneNum = phoneNum;
    [self.messageLabel setText:[NSString stringWithFormat:@"验证码将发送%@手机号，请注意查收",self.phoneNum]];
    @weakify(self);
    __block NSInteger time = 60;
    self.disposable = [[RACSignal interval:1.f onScheduler:[RACScheduler mainThreadScheduler]]subscribeNext:^(NSDate * _Nullable x) {
        @strongify(self);
       
        NSString * info = @"重新获取";
        time--;
        if(time>0){
            info = [NSString stringWithFormat:@"%lds",time];
            [self.replayGetRegiestCode setUserInteractionEnabled:NO];
        }else{
            time = 60;
            info = @"重新获取";
            [self.disposable dispose];
            [self.replayGetRegiestCode setUserInteractionEnabled:YES];
            [self.timeCountDownCompleteSignal sendNext:nil];
            [self.messageLabel setText:@"如果您还没有收到短信，请点击重新获取！"];
        }
        [self.replayGetRegiestCode setText:info];
    }];
}
@end
