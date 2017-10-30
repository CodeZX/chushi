//
//  WYCRigsterController.m
//  初试
//
//  Created by 中企互联 on 2017/10/16.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCRigsterController.h"
#import "WYCForgetController.h"
#import "RSAUtil.h"
#import "HttpTool.h"
#import "UIButton+CountDown.h"
#import "SVProgressHUD.h"
#import "WYCAuthenticationController.h"

@interface WYCRigsterController ()
/** 手机号*/
@property(nonatomic,strong)UITextField * userField;

/** code 验证码*/
@property(nonatomic,strong)UITextField * codeTexField;

/** psaaword*/
@property(nonatomic,strong)UITextField * passwordTexfield;

/** 再次输入*/
@property(nonatomic,strong)UITextField * ZpasswordTexField;

/** 邀请码*/
@property(nonatomic,strong)UITextField * Invitationtexfield;

/** 注册码*/
@property(nonatomic,strong)UITextField * Registrationtexfield;
@end

@implementation WYCRigsterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //界面
    [self setupCreat];
    
    
    
    //注册观察键盘的变化
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(transformView:) name:UIKeyboardWillChangeFrameNotification object:nil];

}
//键盘回收
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for(UIView *view in self.view.subviews)
    {
        [view resignFirstResponder];
        
    }
}

//移动UIView
-(void)transformView:(NSNotification *)aNSNotification
{
    //获取键盘弹出前的Rect
    NSValue *keyBoardBeginBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect=[keyBoardBeginBounds CGRectValue];
    
    //获取键盘弹出后的Rect
    NSValue *keyBoardEndBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect  endRect=[keyBoardEndBounds CGRectValue];
    
    //获取键盘位置变化前后纵坐标Y的变化值
    CGFloat deltaY=endRect.origin.y-beginRect.origin.y;
    NSLog(@"看看这个变化的Y值:%f",deltaY);
    
    //在0.25s内完成self.view的Frame的变化，等于是给self.view添加一个向上移动deltaY的动画
    [UIView animateWithDuration:0.25f animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY, self.view.frame.size.width, self.view.frame.size.height)];
    }];
}


//界面布局
- (void)setupCreat {
    
    UIView * registerView = [[UIView alloc] init];
    registerView.frame = CGRectMake(0, 0, ScreenWidth, 64);
    registerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:registerView];
    
    
    //不是Nav。所以自己写的View和label
    UILabel * NavRigsterLabel = [[UILabel alloc] init];
    NavRigsterLabel.frame = CGRectMake(ScreenWidth / 2 - 100 * px, 0, 200 * px, 64);
    NavRigsterLabel.textColor = [UIColor whiteColor];
//    NavRigsterLabel.font = [UIFont systemFontOfSize:BigFont];
    NavRigsterLabel.font = [UIFont boldSystemFontOfSize:BigFont];
    NavRigsterLabel.textAlignment = NSTextAlignmentCenter;
    NavRigsterLabel.text = @"注册";
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
    //    usertexfield.backgroundColor = [UIColor redColor];
    usertexfield.placeholder = @"请输入手机号";
    [self.view addSubview:usertexfield];
    self.userField = usertexfield;
    
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
    //    usertexfield.backgroundColor = [UIColor redColor];
    passtexfield.placeholder = @"请输入密码";
    passtexfield.secureTextEntry = YES;
    [self.view addSubview:passtexfield];
    self.passwordTexfield = passtexfield;
    
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
    Zpasstexfield.secureTextEntry = YES;
    //    usertexfield.backgroundColor = [UIColor redColor];
    [self.view addSubview:Zpasstexfield];
    self.ZpasswordTexField = Zpasstexfield;
    
    //手机提示线
    UIView * ZpassView = [[UIView alloc] init];
    ZpassView.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(Zpasstexfield.frame) + 5 * px, usertexfield.width, 1);
    ZpassView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:ZpassView];
    
    
    
    
    
    
    /**********注册码**********/
    
    UIImageView * rationteximage = [[UIImageView alloc] init];
    rationteximage.image = [UIImage imageNamed:@"group"];
    rationteximage.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(ZpassView.frame) + 50 * px, iphoneimageW, iphoneimageW);
    [self.view addSubview:rationteximage];
    
    
    UITextField * Registrationtexfield = [[UITextField alloc] init];
    Registrationtexfield.frame = CGRectMake(Zpasstexfield.x, CGRectGetMaxY(ZpassView.frame) + 50 * px, ScreenWidth - iphoneimageW * 4, iphoneimageW);
    Registrationtexfield.placeholder = @"请输入注册码";
    Registrationtexfield.secureTextEntry = YES;
    //    usertexfield.backgroundColor = [UIColor redColor];
    [self.view addSubview:Registrationtexfield];
    self.Registrationtexfield = Registrationtexfield;
    
    //手机提示线
    UIView * RegistrationView = [[UIView alloc] init];
    RegistrationView.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(Registrationtexfield.frame) + 5 * px, usertexfield.width, 1);
    RegistrationView.backgroundColor = WYCRGBColor(233, 162, 21);
    [self.view addSubview:RegistrationView];
    
    
    
    
    //登录按钮
    UIButton * loginButton = [[UIButton alloc] init];
    loginButton.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(RegistrationView.frame) + 100 * px, ScreenWidth - iphoneimage.x * 2, 200 * px);
    loginButton.backgroundColor = WYCRGBColor(239, 177, 22);
    loginButton.layer.cornerRadius = 100 * px;
    [loginButton setTitle:@"下一步" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:72 * px];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(RegisterClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    
    UILabel * PromptLable = [[UILabel alloc] init];
    PromptLable.frame = CGRectMake(loginButton.x + 20 * px, CGRectGetMaxY(loginButton.frame) + 30 * px, loginButton.width / 2, 60 * px);
    PromptLable.textColor = WYCRGBColor(157, 157, 157);
    PromptLable.font = [UIFont systemFontOfSize:43 * px];
    PromptLable.text = @"点击注册,表示您同意";
    [self.view addSubview:PromptLable];
    
    
    
    //用户须知的按钮
    UIButton * userAgreement = [[UIButton alloc] init];
    [userAgreement setTitle:@"【智能信用卡管理用户协议】" forState:UIControlStateNormal];
    userAgreement.titleLabel.font = [UIFont systemFontOfSize:43 * px];
    userAgreement.frame = CGRectMake(CGRectGetMaxX(PromptLable.frame) - 110 * px, PromptLable.y, PromptLable.width + 90 * px, PromptLable.height);
    [userAgreement setTitleColor:WYCRGBColor(239, 177, 22) forState:UIControlStateNormal];
    [self.view addSubview:userAgreement];
}

//下一步
- (void)RegisterClick{
    
    //手机号判断是否为空
//    if(self.userField.text.length == 0)
//    {
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"手机号不能为空"];
//        return;
//    }
//    //验证码判断是否为空
//    if(self.codeTexField.text.length == 0)
//    {
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请输入验证码"];
//        return;
//    }
//    //手机号判断是否为空
//    if(self.passwordTexfield.text.length == 0)
//    {
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"密码不能为空"];
//        return;
//    }
//    //密码判断是否为空
//
//    if(self.passwordTexfield.text != self.ZpasswordTexField.text)
//    {
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"两次输入密码不一致"];
//        return;
//    }
//    [self setupcode];
//    NSMutableDictionary * params = [NSMutableDictionary dictionary];
//    NSString * passStr = [NSString stringWithFormat:@"%@",self.passwordTexfield.text];
//    NSString *pas = [RSAUtil encryptString:passStr publicKey:RSA_P_KEY];
////
//    params[@"mobile"] = self.userField.text;
//    params[@"password"] = pas;
//    params[@"authcode"] = self.codeTexField.text;
//    params[@"regCode"] = @"000000";
//    [HttpTool postWithURLString:Register parameters:params success:^(NSDictionary *data) {
//        if ([[data objectForKey:@"code"] intValue] == 0){
//            WYCLog(@"==========>>>>%@",data);
//        NSDictionary * dict = [data objectForKey:@"result"];
//
    
            WYCAuthenticationController * authen = [[WYCAuthenticationController alloc] init];
            [self presentViewController:authen animated:NO completion:nil];
//        WYCAccount * Account = [[WYCAccount alloc] initWithDic:dict];
//
//        [WYCAccountTool saveAccount:Account];
//
//        [WYCIsAppLoginTool saveIsAppLogin:YES];
//
//        }else{
//
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//
//        }
//    } failure:^(NSError *error) {
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//    }];

}
//获取验证码
- (void)setupcode{
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    
    
    params[@"mobile"] = self.userField.text;
    params[@"type"] = Rcodekey;
    params[@"authcode"] = self.codeTexField.text;
    
//    [HttpTool postWithURLString:Rigstercode parameters:params success:^(NSDictionary *data) {
//        if ([[data objectForKey:@"code"] intValue] == 0){
//
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"验证成功"];
//    }else{
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//
//    }
//    } failure:^(NSError *error) {
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//    }];

}


//点击获取验证码
- (void)countDownBtnAction:(UIButton *)button{
    
    if (self.userField.text.length == 0) {
        
        NSString * showStr = @"手机号不能为空";
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:showStr];
    }else{
    [button startWithTime:59 title:@"点击重新获取" countDownTitle:@"s后重新获取" mainColor:[UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:0] countColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];

        //获取验证码
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"mobile"] = self.userField.text;
        params[@"type"] = Rcodekey;
//        [HttpTool postWithURLString:Rcode parameters:params success:^(NSDictionary *data) {
//            WYCLog(@"-------%@",data);
//            if([[data objectForKey:@"code"] intValue] == 0){
//                
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//            }
//            else
//            {
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//            }
//        } failure:^(NSError *error) {
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//        }];

}
}

//返回diss掉控制器

- (void)backClick{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

@end
