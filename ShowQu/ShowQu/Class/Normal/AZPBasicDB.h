//
//  AZPBasicDB.h
//  ShowQu
//
//  Created by Bx on 2019/6/6.
//  Copyright © 2019 bx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JQFMDB/JQFMDB.h>
NS_ASSUME_NONNULL_BEGIN

@interface AZPBasicDB : NSObject
///**
// (主键id,自动创建) 返回最后插入的primary key id
// @param tableName 表的名称
// */
//- (NSInteger)lastInsertPrimaryKeyId:(NSString *)tableName;
//
+ (NSInteger) lastInsertPrimaryKeyId:(NSString *)tableName;

// */
//- (BOOL)jq_createTable:(NSString *)tableName dicOrModel:(id)parameters;
//
+ (BOOL)jq_createTable:(NSString *)tableName dicOrModel:(id)parameters;

///**
// 增加: 向表中插入数据
//
// @param tableName 表的名称
// @param parameters 要插入的数据,可以是model或dictionary(格式:@{@"name":@"小李"})
// @return 是否插入成功
// */
//- (BOOL)jq_insertTable:(NSString *)tableName dicOrModel:(id)parameters;
//
+ (BOOL)jq_insertTable:(NSString *)tableName dicOrModel:(id)parameters;
///**
// 删除: 根据条件删除表中数据
//
// @param tableName 表的名称
// @param format 条件语句, 如:@"where name = '小李'"
// @return 是否删除成功
// */
//- (BOOL)jq_deleteTable:(NSString *)tableName whereFormat:(NSString *)format, ...;
//
+ (BOOL)jq_deleteTable:(NSString *)tableName whereFormat:(NSString *)format, ...;
///**
// 更改: 根据条件更改表中数据
//
// @param tableName 表的名称
// @param parameters 要更改的数据,可以是model或dictionary(格式:@{@"name":@"张三"})
// @param format 条件语句, 如:@"where name = '小李'"
// @return 是否更改成功
// */
//- (BOOL)jq_updateTable:(NSString *)tableName dicOrModel:(id)parameters whereFormat:(NSString *)format, ...;
+ (BOOL)jq_updateTable:(NSString *)tableName dicOrModel:(id)parameters whereFormat:(NSString *)format, ...;
//
///**
// 查找: 根据条件查找表中数据
//
// @param tableName 表的名称
// @param parameters 每条查找结果放入model(可以是[Person class] or @"Person" or Person实例)或dictionary中
// @param format 条件语句, 如:@"where name = '小李'",
// @return 将结果存入array,数组中的元素的类型为parameters的类型
// */
//- (NSArray *)jq_lookupTable:(NSString *)tableName dicOrModel:(id)parameters whereFormat:(NSString *)format, ...;
//
+ (NSArray *)jq_lookupTable:(NSString *)tableName dicOrModel:(id)parameters whereFormat:(NSString *)format, ...;
///**
// 批量插入或更改
//
// @param dicOrModelArray 要insert/update数据的数组,也可以将model和dictionary混合装入array
// @return 返回的数组存储未插入成功的下标,数组中元素类型为NSNumber
// */

+ (NSArray *)jq_insertTable:(NSString *)tableName dicOrModelArray:(NSArray *)dicOrModelArray;
//- (NSArray *)jq_insertTable:(NSString *)tableName dicOrModelArray:(NSArray *)dicOrModelArray;
//
//// `删除表

//- (BOOL)jq_deleteTable:(NSString *)tableName;
+ (BOOL)jq_deleteTable:(NSString *)tableName;
//// `清空表
//- (BOOL)jq_deleteAllDataFromTable:(NSString *)tableName;
+ (BOOL)jq_deleteAllDataFromTable:(NSString *)tableName;
//// `是否存在表
//- (BOOL)jq_isExistTable:(NSString *)tableName;
+ (BOOL)jq_isExistTable:(NSString *)tableName;
//// `表中共有多少条数据
//- (int)jq_tableItemCount:(NSString *)tableName;
+ (int)jq_tableItemCount:(NSString *)tableName;
//// `返回表中的字段名
//- (NSArray *)jq_columnNameArray:(NSString *)tableName;
//
+ (NSArray *)jq_columnNameArray:(NSString *)tableName;
//// `关闭数据库
//- (void)close;
+ (void)close;
//// `打开数据库 (每次shareDatabase系列操作时已经open,当调用close后若进行db操作需重新open或调用shareDatabase)
//- (void)open;
+ (void)open;
@end

NS_ASSUME_NONNULL_END
