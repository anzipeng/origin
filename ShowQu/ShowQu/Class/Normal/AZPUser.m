//
//  AZPUser.m
//  ShowQu
//
//  Created by Bx on 2019/5/27.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPUser.h"
#import "MJExtension.h"
static  NSString * const  user_ = @"user";
static  NSString * const firstLogin_ = @"firstLogin";
@interface AZPUser(){
    NSString * _currentUserName;
}

@end
@implementation AZPUser
static AZPUser * instace;
+ (void)setUserSigle:(RACSignal *)userSignle{
    [userSignle subscribeNext:^(id  _Nullable x) {
        User * user = (User *)x;
        [UserDefault setObject:[user mj_keyValues] forKey:user_];
        [UserDefault synchronize];
        
    } error:^(NSError * _Nullable error) {
        
    }];
}
+(void)firstLoginSigle:(RACSignal *)firstLoginSigle{
    [firstLoginSigle subscribeNext:^(id  _Nullable x) {
        [UserDefault setBool:YES forKey:firstLogin_];
    } error:^(NSError * _Nullable error) {
        
    }];
}
+ (RACCommand *)removeUserRACCommand{
    return  [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSDictionary * userD = [UserDefault objectForKey:user_];
            if(userD != nil){
                [UserDefault removeObjectForKey:user_];
            }
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
}
+ (RACCommand *)getCurrentUserCommand{
    return [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSDictionary * userD = [UserDefault objectForKey:user_];
            if(userD == nil){
                [subscriber sendNext:@"no_user_login"];
                [subscriber sendCompleted];
                return nil;
            }
            User * user  = [User mj_objectWithKeyValues:userD];
            [subscriber sendNext:user];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}
+ (RACCommand *)isFirstLoginCommand{
    return [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSDictionary * d = [UserDefault objectForKey:firstLogin_];
            [subscriber sendNext:@((d == nil)?YES:NO)];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}

@end
@implementation User

@end