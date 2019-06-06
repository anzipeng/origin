//
//  AZPRegiestOrLoginView.h
//  ShowQu
//
//  Created by Bx on 2019/6/3.
//  Copyright © 2019 bx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZPRegiestCode.h"
#import "AZPNameAndPasswrd.h"
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, PhoneRegiestType) {
    PhoneRegiest  = 0,
    PhoneLogin,
};
@interface AZPRegiestOrLoginView : UIView
+ (AZPRegiestOrLoginView *) loadNibWithType:(PhoneRegiestType)type;

@property (nonatomic,strong) AZPRegiestCode * regiestCodeView;
@property (nonatomic,strong) AZPNameAndPasswrd *nameAndPasswordView;

@property(nonatomic,strong) RACSubject * scrollerOffsetSignal;
@property (strong, nonatomic) IBOutlet UIScrollView *contentScrollerView;
@end

NS_ASSUME_NONNULL_END
