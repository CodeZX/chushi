//
//  WYCInformationController.m
//  初试
//
//  Created by 中企互联 on 2017/10/13.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCInformationController.h"
#import "WYCIDController.h"
#import "WYCSIDController.h"
#import "WYCPCardController.h"
@interface WYCInformationController ()

@end

@implementation WYCInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"信息认证";
    
    
    //界面布局
    [self setupcreat];
}

//界面布局
- (void)setupcreat{
    UIView * backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 0, ScreenWidth, 780 * px);
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    //信用卡正面
    UILabel * PositiveLabel = [[UILabel alloc] init];
    PositiveLabel.frame = CGRectMake(40 * px, 40 * px, 300 * px, 72 * px);
    PositiveLabel.font = [UIFont systemFontOfSize:MiddleFont];
    PositiveLabel.text = @"身份证正面";
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
    
    
    
    //覆盖按钮
    
    
    //身份证正面
    UIButton * puIDButton = [[UIButton alloc] init];
    puIDButton.frame = CGRectMake(0, 0, ScreenWidth, 152 * px);
    [puIDButton addTarget:self action:@selector(PuIDClick) forControlEvents:UIControlEventTouchUpInside];
//    puIDButton.backgroundColor = [UIColor redColor];
    [backView addSubview:puIDButton];
    
    
    //身份证反面
    UIButton * SIDButton = [[UIButton alloc] init];
    SIDButton.frame = CGRectMake(0, CGRectGetMaxY(puIDButton.frame), ScreenWidth, 152 * px);
    [SIDButton addTarget:self action:@selector(SIDClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:SIDButton];
    
    
    //绑定银行卡
    UIButton * bindingButton = [[UIButton alloc] init];
    bindingButton.frame = CGRectMake(0, backView.height - 152 * px, ScreenWidth, 152 * px);
    [bindingButton addTarget:self action:@selector(bindingClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:bindingButton];
    
    /**********************
     *********身份证反面*****
     **********************/
    
    //信用卡反面
    UILabel * sideLabel = [[UILabel alloc] init];
    sideLabel.frame = CGRectMake(40 * px, CGRectGetMaxY(pline.frame) + 40 * px, 300 * px, 72 * px);
    sideLabel.font = [UIFont systemFontOfSize:MiddleFont];
    sideLabel.text = @"身份证反面";
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
    
    
    
    
    /**********************
     *****手持信用卡正面*****
     **********************/
    
    //信用卡反面
    UILabel * holdLabel = [[UILabel alloc] init];
    holdLabel.frame = CGRectMake(40 * px, CGRectGetMaxY(sline.frame) + 40 * px, 500 * px, 72 * px);
    holdLabel.font = [UIFont systemFontOfSize:MiddleFont];
    holdLabel.text = @"手持身份证正面";
    [backView addSubview:holdLabel];
    
    //分割线
    UIView * hline = [[UIView alloc] init];
    hline.frame = CGRectMake(40 * px, CGRectGetMaxY(holdLabel.frame) + 40 * px, ScreenWidth, 1);
    hline.backgroundColor = WYCRGBColor(242, 242, 242);
    [backView addSubview:hline];
    
    //是否扫描
    UILabel * hslabel = [[UILabel alloc] init];
    hslabel.frame = CGRectMake(backView.width  - 240 * px, holdLabel.y, 200 * px, PositiveLabel.height);
    hslabel.text = @"已上传";
    hslabel.textColor = WYCRGBColor(72, 205, 0);
    [backView addSubview:hslabel];
    
    
    /**********************
     *****手持信用卡反面*****
     **********************/
    
    //信用卡反面
    UILabel * PuserLabel = [[UILabel alloc] init];
    PuserLabel.frame = CGRectMake(40 * px, CGRectGetMaxY(hline.frame) + 40 * px, 500 * px, 72 * px);
    PuserLabel.font = [UIFont systemFontOfSize:MiddleFont];
    PuserLabel.text = @"手持身份证反面";
    [backView addSubview:PuserLabel];
    
    //分割线
    UIView * puline = [[UIView alloc] init];
    puline.frame = CGRectMake(40 * px, CGRectGetMaxY(PuserLabel.frame) + 40 * px, ScreenWidth, 1);
    puline.backgroundColor = WYCRGBColor(242, 242, 242);
    [backView addSubview:puline];
    
    //是否扫描
    UILabel * puimagelabel = [[UILabel alloc] init];
    puimagelabel.frame = CGRectMake(backView.width  - 240 * px, PuserLabel.y, 200 * px, PositiveLabel.height);
    puimagelabel.text = @"已上传";
    puimagelabel.textColor = WYCRGBColor(72, 205, 0);
    [backView addSubview:puimagelabel];
    
    
    /**********************
     *****银行卡正面*****
     **********************/
    
    //信用卡反面
    UILabel * pbankLabel = [[UILabel alloc] init];
    pbankLabel.frame = CGRectMake(40 * px, CGRectGetMaxY(puline.frame) + 40 * px, 500 * px, 72 * px);
    pbankLabel.font = [UIFont systemFontOfSize:MiddleFont];
    pbankLabel.text = @"银行卡正面";
    [backView addSubview:pbankLabel];
    
    //分割线
    UIView * pbankline = [[UIView alloc] init];
    pbankline.frame = CGRectMake(40 * px, CGRectGetMaxY(pbankLabel.frame) + 40 * px, ScreenWidth, 1);
    pbankline.backgroundColor = WYCRGBColor(242, 242, 242);
    [backView addSubview:pbankline];
    
    //是否扫描
    UILabel * pubankimagelabel = [[UILabel alloc] init];
    pubankimagelabel.frame = CGRectMake(backView.width  - 240 * px, pbankLabel.y, 200 * px, PositiveLabel.height);
    pubankimagelabel.text = @"已上传";
    pubankimagelabel.textColor = WYCRGBColor(72, 205, 0);
    [backView addSubview:pubankimagelabel];
    
    
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

//身份证正面
- (void)PuIDClick{
    WYCIDController * idController = [[WYCIDController alloc] init];
    [self.navigationController pushViewController:idController animated:NO];
    
}

//身份证反面
- (void)SIDClick{
    WYCSIDController *SIDController = [[WYCSIDController alloc] init];
    [self.navigationController pushViewController:SIDController animated:NO];
    
}

- (void)bindingClick{
    WYCPCardController * pcard = [[WYCPCardController alloc] init];
    [self.navigationController pushViewController:pcard animated:NO];
    
}
@end
