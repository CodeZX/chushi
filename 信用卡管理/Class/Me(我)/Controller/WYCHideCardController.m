//
//  WYCHideCardController.m
//  初试
//
//  Created by 中企互联 on 2017/10/13.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCHideCardController.h"
#import "WYCChoiceController.h"
#import "WYCInputController.h"
@interface WYCHideCardController ()

@end

@implementation WYCHideCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Nav字体颜色+ 背景
    
    [self setupNav];
    
    
    //界面布局
    [self SetupCreat];
    
    
}
- (void)SetupCreat{
    UIView * backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 0, ScreenWidth, 500 * px);
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    //邮箱图片
    UIImageView * mailImageView = [[UIImageView alloc] init];
    mailImageView.frame = CGRectMake(40 * px, 80 * px, 80 * px, 80 * px);
    mailImageView.image = [UIImage imageNamed:@"mail"];
    [backView addSubview:mailImageView];
    
    
    //邮箱label
    UILabel * maillabel = [[UILabel alloc] init];
    maillabel.frame = CGRectMake(CGRectGetMaxX(mailImageView.frame) + 40 * px, mailImageView.y - 20 * px, 230 * px, 62 * px);
    maillabel.font = [UIFont systemFontOfSize:56 * px];
    
    maillabel.text = @"邮箱导入";
    [backView addSubview:maillabel];
    
    
    //绑定账单邮箱号
    //邮箱label
    UILabel * mailnumlabel = [[UILabel alloc] init];
    mailnumlabel.frame = CGRectMake(maillabel.x, CGRectGetMaxY(maillabel.frame) + 20 * px, ScreenWidth, 62 * px);
    mailnumlabel.textColor = WYCRGBColor(167, 167, 167);
    mailnumlabel.font = [UIFont systemFontOfSize:45 * px];
    mailnumlabel.text = @"绑定账单收取邮箱,一键获取信用卡账单";
    [backView addSubview:mailnumlabel];
    
    
    UIView *mailView = [[UIView alloc] init];
    mailView.frame = CGRectMake(maillabel.x, CGRectGetMaxY(mailnumlabel.frame) + 40 * px, ScreenWidth, 1);
    mailView.backgroundColor = WYCRGBColor(242, 242, 242);
    [backView addSubview:mailView];
    
    UIImageView * pushImage = [[UIImageView alloc] init];
    pushImage.image = [UIImage imageNamed:@"pushC"];
    pushImage.frame = CGRectMake(backView.width - 40 * px - 40 * px, maillabel.y + 30 * px, 30 * px, 50 * px);
    [backView addSubview:pushImage];
    
    //跳转用<没用tableview，用需加type类型判断>
    UIButton * onebutton = [[UIButton alloc] init];
    onebutton.frame = CGRectMake(0, 0, ScreenWidth, 300);
    [onebutton addTarget:self action:@selector(oneClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:onebutton];
    
    //手动账单
    //手动账单图标
    UIImageView * manualImage = [[UIImageView alloc] init];
    manualImage.frame = CGRectMake(mailImageView.x, CGRectGetMaxY(mailView.frame) + 80 * px, 80 * px, 80 * px);
    manualImage.image = [UIImage imageNamed:@"Manual"];
    [backView addSubview:manualImage];


    //邮箱label
    UILabel * manuallabel = [[UILabel alloc] init];
    manuallabel.frame = CGRectMake(CGRectGetMaxX(manualImage.frame) + 40 * px, manualImage.y - 20 * px, 230 * px, 62 * px);
    manuallabel.font = [UIFont systemFontOfSize:56 * px];

    manuallabel.text = @"手输账单";
    [backView addSubview:manuallabel];


    //绑定账单邮箱号
    //邮箱label
    UILabel * manualnumlabel = [[UILabel alloc] init];
    manualnumlabel.frame = CGRectMake(CGRectGetMaxX(manualImage.frame) + 40 * px, CGRectGetMaxY(manuallabel.frame) + 20 * px, ScreenWidth, 62 * px);
    manualnumlabel.textColor = WYCRGBColor(167, 167, 167);
    manualnumlabel.font = [UIFont systemFontOfSize:45 * px];
    manualnumlabel.text = @"没有邮箱、网银账单？请用手动输入账单";
    [backView addSubview:manualnumlabel];
    
    UIImageView * MImage = [[UIImageView alloc] init];
    MImage.image = [UIImage imageNamed:@"pushC"];
    MImage.frame = CGRectMake(backView.width - 40 * px - 40 * px, manualImage.y + 30 * px, 30 * px, 50 * px);
    [backView addSubview:MImage];
    
    //跳转用<没用tableview，用需加type类型判断>
    UIButton * towbutton = [[UIButton alloc] init];
    towbutton.frame = CGRectMake(0, CGRectGetMaxY(mailView.frame), ScreenWidth, 300);
    [towbutton addTarget:self action:@selector(towClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:towbutton];
    
    
}
//Nav字体颜色+ 背景
- (void)setupNav {
    self.navigationItem.title = @"导入账单";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}


//邮箱跳转
- (void)oneClick{
    WYCChoiceController * Choice = [[WYCChoiceController alloc] init];
    [self.navigationController pushViewController:Choice animated:NO];
    
}
//手动账单跳转
- (void)towClick{
    WYCInputController * input = [[WYCInputController alloc] init];
    [self.navigationController pushViewController:input animated:NO];
}
@end
