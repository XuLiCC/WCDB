//
//  TableManager.h
//  WCDB
//
//  Created by 炼金 on 2018/1/15.
//  Copyright © 2018年 炼金. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"

@interface TableManager : NSObject


+ (TableManager *)defalutManager;


#pragma mark ---------创建表
- (void)createTable:(NSString *)table path:(NSString *)path cls:(Class<WCTTableCoding>)cls;

#pragma mark ---------删除表
- (void)deleteTable:(NSString *)table;



@end
