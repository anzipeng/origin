//
//  AZPUser.h
//  ShowQu
//
//  Created by Bx on 2019/5/27.
//  Copyright © 2019 bx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface User :NSObject
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *password;
@end
@interface AZPUser : NSObject
// 注册账户
+(void) regiestUser:(RACSignal *)userSignal;

+(void) setUserSigle:(RACSignal *)userSignle;
+(void) firstLoginSigle:(RACSignal *)firstLoginSigle;
+(RACCommand *) removeUserRACCommand;
+(RACCommand *) isFirstLoginCommand;
+(RACCommand *) getCurrentUserCommand;
@end

NS_ASSUME_NONNULL_END
