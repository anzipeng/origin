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
@property (strong, nonatomic) IBOutlet UITextField *regiestCodeTextField;
@property (strong, nonatomic) IBOutlet UILabel *replayGetRegiestCode;
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (nonatomic,strong) UIGestureRecognizer *gecognizer;
@property (nonatomic,strong) RACDisposable *disposable;


@end

@implementation AZPRegiestCode
+ (AZPRegiestCode *)loadView{
    return [[[NSBundle mainBundle]loadNibNamed:@"AZPRegiestCode" owner:self options:nil]lastObject];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self initUI];
    [self initFuction];
}
- (void) initUI{
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 2;
    self.contentView.layer.borderWidth = .5f;
    self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
}
- (void) initFuction{
    self.gecognizer = [[UIGestureRecognizer alloc]init];
    [self.replayGetRegiestCode addGestureRecognizer:self.gecognizer];
    @weakify(self);
    [[self.gecognizer rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
      
        self.disposable = [[RACSignal interval:1.f onScheduler:[RACScheduler mainThreadScheduler]]subscribeNext:^(NSDate * _Nullable x) {
              @strongify(self);
            NSInteger time = 60;
            NSString * info = @"重新获取";
            time--;
            if(time>0){
                 info = [NSString stringWithFormat:@"%lds",time];
                [self.replayGetRegiestCode setEnabled:NO];
            }else{
                info = @"重新获取";
               [self.replayGetRegiestCode setEnabled:YES];
            }
            [self.replayGetRegiestCode setText:info];
        }];
    }];
}
@end
