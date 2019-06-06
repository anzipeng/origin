//
//  AZPNameAndPasswrd.h
//  ShowQu
//
//  Created by Bx on 2019/6/4.
//  Copyright © 2019 bx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AZPNameAndPasswrd : UIView
@property (strong, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
+ (AZPNameAndPasswrd *)loadView;
@property (nonatomic,copy) NSString *passwordPlacehoder;
@property (nonatomic,assign) float forgetBtnWConstant;
@end

NS_ASSUME_NONNULL_END
