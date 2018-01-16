//
//  TableManager.m
//  WCDB
//
//  Created by 炼金 on 2018/1/15.
//  Copyright © 2018年 炼金. All rights reserved.
//

#import "TableManager.h"

@interface TableManager()

@end


@implementation TableManager

+ (TableManager *)defalutManager
{
    static  TableManager    *manager    = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager     = [[TableManager alloc] init];
    });
    
    return manager;
}

- (void)createTable:(NSString *)table path:(NSString *)path cls:(Class<WCTTableCoding>)cls
{
    WCTDatabase *db    =  [[DBManager defaultManager] createDB];
    /// 数据库是否可以打开
    if ([db canOpen]) {
        /// 数据库是否已经打开
        if ([db isOpened]) {
            if ([db isTableExists:table]) {
                NSLog(@"表已经存在");
            }
            else{
                BOOL    res = [db createTableAndIndexesOfName:table withClass:cls];
                if (res) {
                    NSLog(@"创建表成功");
                }
                else{
                    NSLog(@"创建表又失败了");
                }
            }
        }
        else{
            NSLog(@"数据库没有打开");
        }
    }
    else{
        NSLog(@"数据库不能打开");
    }
    
    
}

- (void)deleteTable:(NSString *)table
{
    
    BOOL    res =   [[DBManager defaultManager].dataBase  dropTableOfName:table];
    if (res) {
        NSLog(@"删除表成功了");
    }
    else{
        NSLog(@"表可能不存在删除失败了");
    }
}

@end
