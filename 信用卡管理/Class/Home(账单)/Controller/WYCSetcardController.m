

//
//  WYCSetcardController.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCSetcardController.h"

@interface WYCSetcardController ()

@end

@implementation WYCSetcardController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Nav按钮及颜色
    [self setupNavButton];
    
    [self setupcreat];
}
- (void)setupcreat{
    
    UIView * backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 0, ScreenWidth, 280 * px);
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    //信用卡正面
    UILabel * PositiveLabel = [[UILabel alloc] init];
    PositiveLabel.frame = CGRectMake(40 * px, 40 * px, 300 * px, 72 * px);
    PositiveLabel.font = [UIFont systemFontOfSize:MiddleFont];
    PositiveLabel.text = @"银行卡正面";
    [backView addSubview:PositiveLabel];
    
    //分割线
    UIView * pline = [[UIView alloc] init];
    pline.frame = CGRectMake(40 * px, CGRectGetMaxY(PositiveLabel.frame) + 40 * px, ScreenWidth, 1);
    pline.backgroundColor = WYCRGBColor(242, 242, 242);
    [backView addSubview:pline];
    
    //是否扫描
    UILabel * Sanninglabel = [[UILabel alloc] init];
    Sanninglabel.frame = CGRectMake(backView.width  - 240 * px, PositiveLabel.y, 200 * px, PositiveLabel.height);
    Sanninglabel.text = @"已扫描";
    Sanninglabel.textColor = WYCRGBColor(72, 205, 0);
    [backView addSubview:Sanninglabel];
    
    
    
    /**********************
     *********信用卡反面*****
     **********************/
    
    //信用卡反面
    UILabel * sideLabel = [[UILabel alloc] init];
    sideLabel.frame = CGRectMake(40 * px, CGRectGetMaxY(pline.frame) + 40 * px, 300 * px, 72 * px);
    sideLabel.font = [UIFont systemFontOfSize:MiddleFont];
    sideLabel.text = @"手持卡反面";
    [backView addSubview:sideLabel];
    
    //分割线
    UIView * sline = [[UIView alloc] init];
    sline.frame = CGRectMake(40 * px, CGRectGetMaxY(sideLabel.frame) + 40 * px, ScreenWidth, 1);
    sline.backgroundColor = WYCRGBColor(242, 242, 242);
    [backView addSubview:sline];
    
    //是否扫描
    UILabel * tslabel = [[UILabel alloc] init];
    tslabel.frame = CGRectMake(backView.width  - 240 * px, sideLabel.y, 200 * px, PositiveLabel.height);
    tslabel.text = @"正在扫描";
    tslabel.textColor = WYCRGBColor(72, 205, 0);
    [backView addSubview:tslabel];
    
    
    
    
    
    
    
    //提示
    UILabel * messege = [[UILabel alloc] init];
    messege.frame = CGRectMake(40 * px, CGRectGetMaxY(backView.frame) + 80 * px, ScreenWidth, PositiveLabel.height);
    messege.textColor = WYCRGBColor(123, 123, 238);
    messege.font = [UIFont systemFontOfSize:SmallFont];
    messege.text = @"手持信用卡请完全漏出手臂，确保信用卡号码等信息清晰可见";
    [backView addSubview:messege];
    
    
    //提交按钮
    UIButton *SubmitButton = [[UIButton alloc] init];
    SubmitButton.frame = CGRectMake(40 * px, CGRectGetMaxY(messege.frame) + 160 * px, ScreenWidth - 80 * px, 160 * px);
    SubmitButton.layer.cornerRadius = 5;
    SubmitButton.backgroundColor = WYCRGBColor(239, 177, 22);
    [SubmitButton setTitle:@"提交" forState:UIControlStateNormal];
    [SubmitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:SubmitButton];
}
//Nav按钮及颜色
- (void)setupNavButton{
    self.navigationItem.title = @"更换银行卡";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}

@end
