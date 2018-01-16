//
//  User+WCTTableCoding.h
//  WCDB
//
//  Created by 炼金 on 2018/1/15.
//  Copyright © 2018年 炼金. All rights reserved.
//

#import "User.h"
#import <WCDB/WCDB.h>

@interface User (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(localID)
WCDB_PROPERTY(content)
WCDB_PROPERTY(name)

@end
