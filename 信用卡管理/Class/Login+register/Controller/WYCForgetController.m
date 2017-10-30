//
//  WYCForgetController.m
//  初试
//
//  Created by 中企互联 on 2017/10/16.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCForgetController.h"
#import "UIButton+CountDown.h"
@interface WYCForgetController ()
/** 手机号*/
@property (strong , nonatomic) UITextField *userTexField;

/** 手验证码*/
@property (strong , nonatomic) UITextField *codeTexField;

/** 密码*/
@property (strong , nonatomic) UITextField *passTexField;

/** 再次输入密码*/
@property (strong , nonatomic) UITextField *ZpassTexField;
@end

@implementation WYCForgetController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //界面
    [self setupCreat];
}

- (void)setupCreat {
    
    UIView * registerView = [[UIView alloc] init];
    registerView.frame = CGRectMake(0, 0, ScreenWidth, 64);
    registerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:registerView];
    
    
    //不是Nav。所以自己写的View和label
    UILabel * NavRigsterLabel = [[UILabel alloc] init];
    NavRigsterLabel.frame = CGRectMake(ScreenWidth / 2 - 200 * px, 0, 400 * px, 64);
    NavRigsterLabel.textColor = [UIColor whiteColor];
    //    NavRigsterLabel.font = [UIFont systemFontOfSize:BigFont];
    NavRigsterLabel.font = [UIFont boldSystemFontOfSize:BigFont];
    NavRigsterLabel.textAlignment = NSTextAlignmentCenter;
    NavRigsterLabel.text = @"忘记密码";
    [registerView addSubview:NavRigsterLabel];
    
    
    
    //返回按钮
    UIButton *  backbutton = [[UIButton alloc] init];
    [backbutton setImage:[UIImage imageNamed:@"Nav_back"] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    backbutton.frame = CGRectMake(40 * px, NavRigsterLabel.height / 3 - 30 * px, 40 , 40);
    [registerView addSubview:backbutton];
    
    
    CGFloat iphoneimageW = 80 * px;
    UIImageView * iphoneimage = [[UIImageView alloc] init];
    iphoneimage.image = [UIImage imageNamed:@"iphone"];
    iphoneimage.frame = CGRectMake(120 * px, CGRectGetMaxY(registerView.frame) + 200 * px, iphoneimageW, iphoneimageW);
    [self.view addSubview:iphoneimage];
    
    ////////////////
    //账号输入框/////
    ///////////////
    UITextField * usertexfield = [[UITextField alloc] init];
    usertexfield.frame = CGRectMake(CGRectGetMaxX(iphoneimage.frame) + 30 * px, iphoneimage.y, ScreenWidth - iphoneimageW * 4, iphoneimageW);
    usertexfield.placeholder = @"请输入手机号";
    //    usertexfield.backgroundColor = [UIColor redColor];
    [self.view addSubview:usertexfield];
    self.userTexField = usertexfield;
    
    //手机提示线
    UIView * lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(usertexfield.frame) + 5 * px, usertexfield.width, 1);
    lineView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:lineView];
    
    
    ////////////////
    /////密码输入框/////
    ///////////////
    
    
    
    
    UITextField * codefield = [[UITextField alloc] init];
    codefield.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(lineView.frame) + 50 * px, ScreenWidth - iphoneimageW * 4 - 350 * px, iphoneimageW);
    codefield.placeholder = @"输入验证码";
    //    usertexfield.backgroundColor = [UIColor redColor];
    [self.view addSubview:codefield];
    self.codeTexField = codefield;
    
    //手机提示线
    UIView * passlineView = [[UIView alloc] init];
    passlineView.frame = CGRectMake(codefield.x, CGRectGetMaxY(codefield.frame) + 5 * px, lineView.width, 1);
    passlineView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:passlineView];
    
    //获取验证码
    UIButton * codebutton = [[UIButton alloc] init];
    codebutton.frame = CGRectMake(CGRectGetMaxX(codefield.frame), codefield.y, 350 * px, codefield.height);
    [codebutton setTitleColor:WYCRGBColor(233, 162, 21) forState:UIControlStateNormal];
    codebutton.titleLabel.font = [UIFont systemFontOfSize:SmallFont];
    [codebutton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [codebutton addTarget:self action:@selector(countDownBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codebutton];
    
    
    
    
    
    ////////////////
    //密码输入框/////
    ///////////////
    
    
    UIImageView * passimage = [[UIImageView alloc] init];
    passimage.image = [UIImage imageNamed:@"password"];
    passimage.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(passlineView.frame) + 50 * px, iphoneimageW, iphoneimageW);
    [self.view addSubview:passimage];
    
    
    
    UITextField * passtexfield = [[UITextField alloc] init];
    passtexfield.frame = CGRectMake(CGRectGetMaxX(iphoneimage.frame) + 30 * px, passimage.y, ScreenWidth - iphoneimageW * 4, iphoneimageW);
    passtexfield.placeholder = @"请输入密码";
    [self.view addSubview:passtexfield];
    self.passTexField = passtexfield;
    //手机提示线
    UIView * passView = [[UIView alloc] init];
    passView.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(passtexfield.frame) + 5 * px, usertexfield.width, 1);
    passView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:passView];
    
    
    
    
    /************再次输入密码************/
    
    UIImageView * Zpassimage = [[UIImageView alloc] init];
    Zpassimage.image = [UIImage imageNamed:@"password"];
    Zpassimage.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(passView.frame) + 50 * px, iphoneimageW, iphoneimageW);
    [self.view addSubview:Zpassimage];
    
    
    
    UITextField * Zpasstexfield = [[UITextField alloc] init];
    Zpasstexfield.frame = CGRectMake(CGRectGetMaxX(Zpassimage.frame) + 30 * px, Zpassimage.y, ScreenWidth - iphoneimageW * 4, iphoneimageW);
    Zpasstexfield.placeholder = @"再次输入密码";
    [self.view addSubview:Zpasstexfield];
    
    self.ZpassTexField = Zpasstexfield;
    
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
    [loginButton setTitle:@"立即找回" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:72 * px];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    

}
//获取验证码---->>>事件
- (void)countDownBtnAction:(UIButton *)button{
    
    [button startWithTime:59 title:@"点击重新获取" countDownTitle:@"s后重新获取" mainColor:[UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:0] countColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    
    if (self.userTexField.text.length == 0) {
        
        NSString * showStr = @"手机号不能为空";
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:showStr];
    }else{
        [button startWithTime:59 title:@"点击重新获取" countDownTitle:@"s后重新获取" mainColor:[UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:0] countColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
        
        //获取验证码
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"mobile"] = self.userTexField.text;
        params[@"type"] = Ucodekey;
//        [HttpTool postWithURLString:Rcode parameters:params success:^(NSDictionary *data) {
//            WYCLog(@"-------%@",data);
//            if([[data objectForKey:@"code"] intValue] == 0){
//                
//                [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//            }
//            else
//            {
//                [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//            }
//        } failure:^(NSError *error) {
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//        }];
        
    }
}
//立即找回按钮------>>事件
- (void)loginClick{
    
    WYCLog(@"---------------->");
    
    NSMutableDictionary * param = [NSMutableDictionary dictionary];
    param[@""] = @"";
    param[@""] = @"";
    param[@""] = @"";
    param[@""] = @"";
    
}
//返回diss掉控制器
- (void)backClick{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

@end
