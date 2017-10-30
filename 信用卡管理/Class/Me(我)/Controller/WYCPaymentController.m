//
//  WYCPaymentController.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCPaymentController.h"

@interface WYCPaymentController ()

@end

@implementation WYCPaymentController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Nav字体颜色+ 背景
    
    [self setupNav];
    
    //创建界面
    [self setupcreat];
}

//创建界面
- (void)setupcreat{
    UILabel *showlabel = [[UILabel alloc] init];
    showlabel.frame = CGRectMake(40 * px, 40 * px, ScreenWidth, 72 * px);
    showlabel.text = @"请设置支付密码，用于支付验证";
    showlabel.textColor = WYCRGBColor(157, 157, 157);
    [self.view addSubview:showlabel];
}
//Nav字体颜色+ 背景
- (void)setupNav {
    self.navigationItem.title = @"设置支付密码";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}

@end
