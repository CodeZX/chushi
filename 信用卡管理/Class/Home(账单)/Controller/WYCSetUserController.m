//
//  WYCSetUserController.m
//  初试
//
//  Created by 中企互联 on 2017/10/12.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCSetUserController.h"

@interface WYCSetUserController ()

@end

@implementation WYCSetUserController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Nav按钮及颜色
    [self setupNavButton];
    
    //界面布局
    [self setupcreat];
    
}
- (void)setupcreat{
    UIImageView * userimage = [[UIImageView alloc] init];
    userimage.frame = CGRectMake(80 * px, 80 * px, 120 * px, 120 * px);
    userimage.image = [UIImage imageNamed:@"iphone"];
    [self.view addSubview:userimage];
    
    //手机号输入框
    UITextField * userfield = [[UITextField alloc] init];
    userfield.frame = CGRectMake(CGRectGetMaxX(userimage.frame)+ 40 * px, userimage.y, ScreenWidth - userimage.width - 160 * px * 2, userimage.width);
    userfield.placeholder = @"123456789";
    [self.view addSubview:userfield];
    
    //手机提示线
    UIView * passlineView = [[UIView alloc] init];
    passlineView.frame = CGRectMake(userfield.x, CGRectGetMaxY(userfield.frame) + 5 * px, userfield.width, 1);
    passlineView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:passlineView];
    
    
    /***********************
     **********验证码********
     ***********************/
    UITextField * codefield = [[UITextField alloc] init];
    codefield.frame = CGRectMake(userfield.x, CGRectGetMaxY(passlineView.frame) + 100 * px, passlineView.width / 2, userfield.height);
    codefield.placeholder = @"输入验证码";
    [self.view addSubview:codefield];
    
    //手机提示线
    UIView * YlineView = [[UIView alloc] init];
    YlineView.frame = CGRectMake(codefield.x, CGRectGetMaxY(codefield.frame) + 5 * px, userfield.width, 1);
    YlineView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:YlineView];
    
    //获取验证码
    UIButton * codebutton = [[UIButton alloc] init];
    codebutton.frame = CGRectMake(CGRectGetMaxX(codefield.frame), codefield.y, 350 * px, codefield.height);
    [codebutton setTitleColor:WYCRGBColor(233, 162, 21) forState:UIControlStateNormal];
    [codebutton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:codebutton];
    
    
    //内容消息
    UILabel * titlelabel = [[UILabel alloc] init];
    titlelabel.frame = CGRectMake(codefield.x, CGRectGetMaxY(YlineView.frame) + 30 * px, userfield.width, 130 * px);
    titlelabel.numberOfLines = 0;
    titlelabel.textColor = WYCRGBColor(106, 107, 238);
    titlelabel.text = @"一个手机号只能作为一个账号的登录名，，一个手机号码仅可以被一个账号绑定";
    titlelabel.font = [UIFont systemFontOfSize:WyzFont];
    [self.view addSubview:titlelabel];
    
    
    
    UIButton *SaveButton = [[UIButton alloc] init];
    SaveButton.frame = CGRectMake(80 * px, CGRectGetMaxY(titlelabel.frame) + 160 * px, ScreenWidth - 160 * px, 160 * px);
    SaveButton.layer.cornerRadius = 25;
    SaveButton.backgroundColor = WYCRGBColor(239, 177, 22);
    [SaveButton setTitle:@"提交" forState:UIControlStateNormal];
    [SaveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:SaveButton];
}
//Nav按钮及颜色
- (void)setupNavButton{
    self.navigationItem.title = @"更换手机号";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
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
