//
//  AZPLoginViewManager.h
//  ShowQu
//
//  Created by 安自鹏 on 2019/6/2.
//  Copyright © 2019 bx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, LoginViewType) {
    LoginViewTypeSelect = 0,
};

@interface AZPLoginViewManager : UIView
- (void) showLoginTypeView:(LoginViewType) viewType;
@end

NS_ASSUME_NONNULL_END
