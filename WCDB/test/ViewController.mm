//
//  ViewController.m
//  WCDB
//
//  Created by 炼金 on 2017/11/8.
//  Copyright © 2017年 炼金. All rights reserved.
//

#import "ViewController.h"
#import "TableManager.h"
#import "FirstViewController.h"
#import "User.h"
@interface ViewController ()

{
    UIButton    *createBtn;
    UIButton    *removeBtn;
    UIButton    *queryBtn;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor   = [UIColor grayColor];
    
    createBtn   = [self normalBtn:CGPointMake(100, 100) title:@"创建数据库" tag:10];
    removeBtn   = [self normalBtn:CGPointMake(100, 200) title:@"删除数据库" tag:11];
    queryBtn    = [self normalBtn:CGPointMake(100, 300) title:@"查询数据库" tag:12];
    
    [self.view addSubview:createBtn];
    [self.view addSubview:removeBtn];
    [self.view addSubview:queryBtn];
}

- (void)createTable
{
    NSString    *path       = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path    = [path stringByAppendingString:@"model"];
    [[TableManager defalutManager] createTable:UserTable path:path cls:User.class];
}

- (void)queryTable
{
    [[UserManager defaultManager] queryData];
}

- (void)deleteTable:(NSString *)tableName
{
    [[TableManager defalutManager] deleteTable:tableName];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController  pushViewController:[[FirstViewController alloc] init] animated:YES];
}
#pragma mark ====================

- (UIButton *)normalBtn:(CGPoint)point title:(NSString *)title tag:(NSInteger)tag
{
    UIButton    *button     = [[UIButton alloc] initWithFrame:CGRectMake(point.x, point.y, 100, 30)];
    button.backgroundColor  = [UIColor colorWithRed:arc4random() % 255 green:arc4random() % 255 blue:arc4random() %255 alpha:1];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.tag              = tag;
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)btnClick:(UIButton *)sender
{
    switch (sender.tag) {
        case 10:
            [self createTable];
            break;
        case 11:
            [self deleteTable:UserTable];
            break;
        case 12:
            [self queryTable];
            break;
        default:
            break;
    }
}
@end
