//
//  User.h
//  WCDB
//
//  Created by 炼金 on 2018/1/2.
//  Copyright © 2018年 炼金. All rights reserved.
//

#import <Foundation/Foundation.h>
#define UserTable   @"User"

@interface User : NSObject

@property int localID;

@property (nonatomic, retain) NSString  *content;

@property (nonatomic ,retain) NSString  *name;

@end


@interface UserManager : NSObject

+ (UserManager *)defaultManager;

#pragma mark ---------向表中插入数据
- (void)insertData:(User *)msg;

#pragma mark ---------查询表中数据
- (void)queryData;

#pragma mark ---------删除表中数据
- (void)deleteDataFromTable:(NSString *)tableName;

@end






