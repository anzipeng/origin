//
//  AZPBasicViewController.h
//  ShowQu
//
//  Created by Bx on 2019/5/30.
//  Copyright © 2019 bx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZPUser.h"
NS_ASSUME_NONNULL_BEGIN

@interface AZPBasicViewController : UIViewController
// 子类继承此方法，
- (void) loadDataWithUser:(User *)user;
@end

NS_ASSUME_NONNULL_END
