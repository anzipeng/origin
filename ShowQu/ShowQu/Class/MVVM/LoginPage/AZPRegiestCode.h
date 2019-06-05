//
//  AZPRegiestCode.h
//  ShowQu
//
//  Created by Bx on 2019/6/4.
//  Copyright © 2019 bx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AZPRegiestCode : UIView
@property (nonatomic,strong) RACSubject *timeCountDownCompleteSignal;

@property (strong, nonatomic) IBOutlet UITextField *regiestCodeTextField;
+ (AZPRegiestCode *) loadView;

// 倒计时
- (void) timeCountDownWithPhoneNum:(NSString *)phoneNum;
@end

NS_ASSUME_NONNULL_END
