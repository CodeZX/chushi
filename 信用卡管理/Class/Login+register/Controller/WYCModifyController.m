//
//  WYCModifyController.m
//  初试
//
//  Created by 中企互联 on 2017/10/16.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCModifyController.h"

@interface WYCModifyController ()

@end

@implementation WYCModifyController

- (void)viewDidLoad {
    [super viewDidLoad];
    //界面
    [self setupCreat];
    
    [self setupNav];
}

- (void)setupNav {
    self.navigationItem.title = @"修改密码";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
}
- (void)setupCreat {
    
   
    CGFloat iphoneimageW = 120 * px;
    UIImageView * iphoneimage = [[UIImageView alloc] init];
    iphoneimage.image = [UIImage imageNamed:@"iphone"];
    iphoneimage.frame = CGRectMake(120 * px, 200 * px, iphoneimageW, iphoneimageW);
    [self.view addSubview:iphoneimage];
    
    ////////////////
    //账号输入框/////
    ///////////////
    UITextField * usertexfield = [[UITextField alloc] init];
    usertexfield.frame = CGRectMake(CGRectGetMaxX(iphoneimage.frame) + 30 * px, iphoneimage.y, ScreenWidth - iphoneimageW * 4, iphoneimageW);
    //    usertexfield.backgroundColor = [UIColor redColor];
    [self.view addSubview:usertexfield];
    
    //手机提示线
    UIView * lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(usertexfield.frame) + 5 * px, usertexfield.width, 1);
    lineView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:lineView];
    
    
    ////////////////
    /////密码输入框/////
    ///////////////
    
    UITextField * codefield = [[UITextField alloc] init];
    codefield.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(lineView.frame) + 100 * px, ScreenWidth - iphoneimageW * 4 - 350 * px, iphoneimageW);
    codefield.placeholder = @"输入验证码";
    //    usertexfield.backgroundColor = [UIColor redColor];
    [self.view addSubview:codefield];
    
    //手机提示线
    UIView * passlineView = [[UIView alloc] init];
    passlineView.frame = CGRectMake(codefield.x, CGRectGetMaxY(codefield.frame) + 5 * px, lineView.width, 1);
    passlineView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:passlineView];
    
    //获取验证码
    UIButton * codebutton = [[UIButton alloc] init];
    codebutton.frame = CGRectMake(CGRectGetMaxX(codefield.frame), codefield.y, 350 * px, codefield.height);
    [codebutton setTitleColor:WYCRGBColor(233, 162, 21) forState:UIControlStateNormal];
    [codebutton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:codebutton];
    
    
    
    //    UIImageView * passimage = [[UIImageView alloc] init];
    //    passimage.image = [UIImage imageNamed:@"iphone"];
    //    passimage.frame = CGRectMake(120 * px, CGRectGetMaxY(registerView.frame) + 200 * px, iphoneimageW, iphoneimageW);
    //    [self.view addSubview:passimage];
    
    ////////////////
    //密码输入框/////
    ///////////////
    
    
    UIImageView * passimage = [[UIImageView alloc] init];
    passimage.image = [UIImage imageNamed:@"password"];
    passimage.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(passlineView.frame) + 100 * px, iphoneimageW, iphoneimageW);
    [self.view addSubview:passimage];
    
    
    
    UITextField * passtexfield = [[UITextField alloc] init];
    passtexfield.frame = CGRectMake(CGRectGetMaxX(iphoneimage.frame) + 30 * px, passimage.y, ScreenWidth - iphoneimageW * 4, iphoneimageW);
    //    usertexfield.backgroundColor = [UIColor redColor];
    [self.view addSubview:passtexfield];
    
    //手机提示线
    UIView * passView = [[UIView alloc] init];
    passView.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(passtexfield.frame) + 5 * px, usertexfield.width, 1);
    passView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:passView];
    
    
    
    
    /************再次输入密码************/
    
    UIImageView * Zpassimage = [[UIImageView alloc] init];
    Zpassimage.image = [UIImage imageNamed:@"password"];
    Zpassimage.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(passView.frame) + 100 * px, iphoneimageW, iphoneimageW);
    [self.view addSubview:Zpassimage];
    
    
    
    UITextField * Zpasstexfield = [[UITextField alloc] init];
    Zpasstexfield.frame = CGRectMake(CGRectGetMaxX(Zpassimage.frame) + 30 * px, Zpassimage.y, ScreenWidth - iphoneimageW * 4, iphoneimageW);
    Zpasstexfield.placeholder = @"再次输入密码";
    //    usertexfield.backgroundColor = [UIColor redColor];
    [self.view addSubview:Zpasstexfield];
    
    //手机提示线
    UIView * ZpassView = [[UIView alloc] init];
    ZpassView.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(Zpasstexfield.frame) + 5 * px, usertexfield.width, 1);
    ZpassView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:ZpassView];
    
    
    
    
    //登录按钮
    UIButton * loginButton = [[UIButton alloc] init];
    loginButton.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(ZpassView.frame) + 200 * px, ScreenWidth - iphoneimage.x * 2, 200 * px);
    loginButton.backgroundColor = WYCRGBColor(239, 177, 22);
    loginButton.layer.cornerRadius = 100 * px;
    [loginButton setTitle:@"确认修改" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:72 * px];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    
    //    UILabel * PromptLable = [[UILabel alloc] init];
    //    PromptLable.frame = CGRectMake(loginButton.x + 20 * px, CGRectGetMaxY(loginButton.frame) + 30 * px, loginButton.width / 2, 60 * px);
    //    PromptLable.textColor = WYCRGBColor(157, 157, 157);
    //    PromptLable.font = [UIFont systemFontOfSize:43 * px];
    //    PromptLable.text = @"点击注册,表示您同意";
    //    [self.view addSubview:PromptLable];
    
    
    
    //    //用户须知的按钮
    //    UIButton * userAgreement = [[UIButton alloc] init];
    //    [userAgreement setTitle:@"【智能信用卡管理用户协议】" forState:UIControlStateNormal];
    //    userAgreement.titleLabel.font = [UIFont systemFontOfSize:43 * px];
    //    userAgreement.frame = CGRectMake(CGRectGetMaxX(PromptLable.frame) - 110 * px, PromptLable.y, PromptLable.width + 90 * px, PromptLable.height);
    //    [userAgreement setTitleColor:WYCRGBColor(239, 177, 22) forState:UIControlStateNormal];
    //    [self.view addSubview:userAgreement];
}

//返回diss掉控制器
- (void)loginClick{
    
    WYCLog(@"---------------->");
}
- (void)backClick{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

@end
