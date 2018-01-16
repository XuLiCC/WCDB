//
//  User.m
//  WCDB
//
//  Created by 炼金 on 2018/1/2.
//  Copyright © 2018年 炼金. All rights reserved.
//

#import "User.h"
#import "DBManager.h"
#import "TableManager.h"
#import "User+WCTTableCoding.h"

@interface User()


@end



@implementation User

WCDB_IMPLEMENTATION(User)

/// 绑定到表中的字段（已经是从需要绑定到表中的字段中取它的子集）
WCDB_SYNTHESIZE(User, content)
WCDB_SYNTHESIZE(User, name)
WCDB_SYNTHESIZE(User, localID)

// 约束宏定义数据库的主键
WCDB_PRIMARY(User, localID)

@end

#pragma mark ============================================================

@interface UserManager()

@end

@implementation UserManager


+ (UserManager *)defaultManager
{
    static  UserManager *manager    = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager     = [[UserManager alloc] init];
    });
    
    return manager;
}

- (void)insertData:(User *)msg
{
    BOOL    res     = [[DBManager defaultManager].dataBase insertObject:msg into:UserTable];
    if (res) {
        NSLog(@"插进去了");
    }
    else{
        NSLog(@"没插进去");
    }
}

- (void)queryData
{
    NSArray *msgArr =  [[DBManager defaultManager].dataBase getAllObjectsOfClass:User.class fromTable:UserTable];
    for (int i = 0; i < msgArr.count; i++) {
        NSLog(@"msg == %@",((User *)msgArr[i]).name);
    }
}

- (void)deleteDataFromTable:(NSString *)tableName
{
    BOOL    res     = [[DBManager defaultManager].dataBase deleteAllObjectsFromTable:UserTable];
    if (res) {
        NSLog(@"删完了");
    }
    else{
        NSLog(@"删除失败");
    }
}
@end

