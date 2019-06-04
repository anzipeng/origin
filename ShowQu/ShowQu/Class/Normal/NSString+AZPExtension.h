//
//  NSString+AZPExtension.h
//  ShowQu
//
//  Created by Bx on 2019/6/4.
//  Copyright © 2019 bx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (AZPExtension)
// 判断电话号码
+ (BOOL)validateContactNumber:(NSString *)mobileNum;
@end

NS_ASSUME_NONNULL_END
