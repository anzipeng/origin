//
//  AZPBasicDB.m
//  ShowQu
//
//  Created by Bx on 2019/6/6.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPBasicDB.h"

@implementation AZPBasicDB
+ (NSInteger)lastInsertPrimaryKeyId:(NSString *)tableName{
    return [[JQFMDB shareDatabase]lastInsertPrimaryKeyId:tableName];
}
+ (BOOL)jq_createTable:(NSString *)tableName dicOrModel:(id)parameters{
    return [[JQFMDB shareDatabase]jq_createTable:tableName dicOrModel:parameters];
}
+ (BOOL)jq_insertTable:(NSString *)tableName dicOrModel:(id)parameters{
    if([self jq_isExistTable:tableName]){
        
    }
    return [[JQFMDB shareDatabase]jq_insertTable:tableName dicOrModel:parameters];
}
+ (BOOL)jq_deleteTable:(NSString *)tableName whereFormat:(NSString *)format, ...{
    return [[JQFMDB shareDatabase]jq_deleteTable:tableName whereFormat:format];
}
+ (BOOL)jq_updateTable:(NSString *)tableName dicOrModel:(id)parameters whereFormat:(NSString *)format, ...{
    return [[JQFMDB shareDatabase]jq_updateTable:tableName dicOrModel:parameters whereFormat:format];
}
+ (NSArray *)jq_lookupTable:(NSString *)tableName dicOrModel:(id)parameters whereFormat:(NSString *)format, ...{
    return [[JQFMDB shareDatabase]jq_lookupTable:tableName dicOrModel:parameters whereFormat:format];
}
+ (NSArray *)jq_insertTable:(NSString *)tableName dicOrModelArray:(NSArray *)dicOrModelArray{
    return [[JQFMDB shareDatabase]jq_insertTable:tableName dicOrModelArray:dicOrModelArray];
}
+ (BOOL)jq_deleteTable:(NSString *)tableName{
    return [[JQFMDB shareDatabase]jq_deleteTable:tableName];
}
+ (BOOL)jq_deleteAllDataFromTable:(NSString *)tableName{
    return [[JQFMDB shareDatabase]jq_deleteAllDataFromTable:tableName];
}
+ (BOOL)jq_isExistTable:(NSString *)tableName{
    return [[JQFMDB shareDatabase]jq_isExistTable:tableName];
}
+ (int)jq_tableItemCount:(NSString *)tableName{
    return [[JQFMDB shareDatabase]jq_tableItemCount:tableName];
}
+ (NSArray *)jq_columnNameArray:(NSString *)tableName{
    return [[JQFMDB shareDatabase]jq_columnNameArray:tableName];
}
+ (void)close{
    return [[JQFMDB shareDatabase]close];
}
+ (void)open{
    return [[JQFMDB shareDatabase]open];
}
+ (void) createDbTableIfNotExist:(NSString *)tableName{
    if(![self jq_isExistTable:tableName]){
   
    }
}
@end
