//
//  FirstViewController.m
//  WCDB
//
//  Created by 炼金 on 2018/1/11.
//  Copyright © 2018年 炼金. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "User.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title  =   @"first";
    self.nameLab.text   = [NSString stringWithFormat:@"%u",arc4random()%1000];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController pushViewController:[[SecondViewController alloc] init] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addClick:(UIButton *)sender {
    
    if (![self.nameLab.text isEqualToString:@""] && ![self.sexLab.text isEqualToString:@""]) {
        User    *user   = [[User alloc] init];
        user.content    = self.sexLab.text;
        user.name       = self.nameLab.text;
        [[UserManager defaultManager] insertData:user];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
