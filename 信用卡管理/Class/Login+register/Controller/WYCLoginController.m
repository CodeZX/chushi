//
//  WYCLoginController.m
//  初试
//
//  Created by 中企互联 on 2017/10/10.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCLoginController.h"
#import "XMGTabBarController.h"
#import "WYCRigsterController.h"
#import "WYCForgetController.h"
#import "RSAUtil.h"
#import "NSString+Base64.h"
#import "WYCAuthenticationController.h"

@interface WYCLoginController ()

//按钮下面指示器
@property(nonatomic,strong)UIView * indicatorView;

@property(nonatomic,strong)UIButton *selectButton;


@property(nonatomic,strong)UIButton * button;

//账号登录使用图
@property(nonatomic,strong)UIView * userView;

//验证码视图
@property(nonatomic,strong)UIView * codeView;

//账号密码视图
@property(strong,nonatomic)UIView * loginView;



/** 账号*/
@property(nonatomic,strong)UITextField * userTexField;

/** 密码*/
@property(nonatomic,strong)UITextField * passTexField;




@end

@implementation WYCLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //界面
    [self setupView];
    
    //注册观察键盘的变化
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(transformView:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}
//键盘回收
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for(UIView * view in self.view.subviews)
    {
        [view resignFirstResponder];
        [_loginView resignFirstResponder];
    }
}

//移动UIView
-(void)transformView:(NSNotification *)aNSNotification
{
    //获取键盘弹出前的Rect
    NSValue *keyBoardBeginBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect = [keyBoardBeginBounds CGRectValue];
    
    //获取键盘弹出后的Rect
    NSValue *keyBoardEndBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect  endRect=[keyBoardEndBounds CGRectValue];
    
    //获取键盘位置变化前后纵坐标Y的变化值
    CGFloat deltaY=endRect.origin.y - beginRect.origin.y;
    
    //在0.25s内完成self.view的Frame的变化，等于是给self.view添加一个向上移动deltaY的动画
    [UIView animateWithDuration:0.25f animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY, self.view.frame.size.width, self.view.frame.size.height)];
    }];
}
- (void)setupView {
    //图片logo
    UIImageView * logoimage = [[UIImageView alloc]init];
    CGFloat imagelogoX = ScreenWidth / 3;
    CGFloat imagelogoY = 150 * px;
    logoimage.frame = CGRectMake(imagelogoX,	 imagelogoY, imagelogoX, imagelogoX);
    logoimage.backgroundColor = WYCRGBColor(222, 186, 116);
    [self.view addSubview:logoimage];
    
    //账号登录
    UIView * loginView = [[UIView alloc]init];
    loginView.frame = CGRectMake(0, CGRectGetMaxY(logoimage.frame) + imagelogoY, ScreenWidth,ScreenHeight);
//    loginView.backgroundColor = [UIColor redColor];
    [self.view addSubview:loginView];
    self.loginView = loginView;
    
    //底部黄色指示器
    UIView * indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor  = WYCRGBColor(221, 169, 73);
    indicatorView.height = 2;
    indicatorView.y = 114 * px * 2;
    
    [loginView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    NSArray * buttonarray = @[@"账号密码登录",@"验证码快捷登录"];
    CGFloat width = 500 * px;
    CGFloat height = 72 * px;
    
    
    for (int i = 0; i < buttonarray.count; i++) {
        UIButton * button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor whiteColor];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = i  * width + 100 * px;
        button.y = 114 * px;
        button.titleLabel.font = [UIFont systemFontOfSize:56 * px];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:56 * px];
        
        [button setTitle:buttonarray[i] forState:UIControlStateNormal];
        [button layoutIfNeeded];//强制布局
        
        [button setTitleColor:WYCRGBColor(154, 154, 154) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
        [loginView addSubview:button];
        
        if (i == 0) {

            button.enabled = NO;
            self.selectButton = button;
            self.indicatorView.width = button.width / 6;
            self.indicatorView.centerX = button.centerX;
            self.userView.hidden = NO;
            //账号密码登录方法界面
            [self setupUserorPass];
        }
    }
    
    [loginView addSubview:indicatorView];
 
    //登录按钮
    UIButton * loginButton = [[UIButton alloc] init];
    loginButton.frame = CGRectMake(self.selectButton.x, 900 * px, ScreenWidth - self.selectButton.x * 2, 200 * px);
    loginButton.backgroundColor = WYCRGBColor(239, 177, 22);
    loginButton.layer.cornerRadius = 100 * px;
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:72 * px];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [loginView addSubview:loginButton];
    
    //立即注册 + 忘记密码？
    
    CGFloat widthX = ScreenWidth / 4;
    UIButton * registerbutton = [[UIButton alloc] init];
    registerbutton.frame = CGRectMake(widthX, CGRectGetMaxY(loginButton.frame) + 50 * px, widthX, 60 * px);
    [registerbutton setTitleColor:WYCRGBColor(154, 154, 154) forState:UIControlStateNormal];
    [registerbutton setTitle:@"立即注册" forState:UIControlStateNormal];
//    registerbutton.backgroundColor = [UIColor redColor];
    registerbutton.titleLabel.font = [UIFont systemFontOfSize:56 * px];
    [registerbutton addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [loginView addSubview:registerbutton];
    
    //分割线
    UIView * lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(CGRectGetMaxX(registerbutton.frame), registerbutton.y, 1, registerbutton.height);
    lineView.backgroundColor = WYCRGBColor(154, 154, 154);
    [loginView addSubview:lineView];
    
    //忘记密码
    UIButton * forgetbutton = [[UIButton alloc] init];
    forgetbutton.frame = CGRectMake(CGRectGetMaxX(lineView.frame) + 30 * px, CGRectGetMaxY(loginButton.frame) + 50 * px, widthX, 60 * px);
    [forgetbutton setTitleColor:WYCRGBColor(154, 154, 154) forState:UIControlStateNormal];
    [forgetbutton setTitle:@"忘记密码？" forState:UIControlStateNormal];
//    forgetbutton.backgroundColor = [UIColor redColor];
    forgetbutton.titleLabel.font = [UIFont systemFontOfSize:56 * px];
    [forgetbutton addTarget:self action:@selector(forgetClick) forControlEvents:UIControlEventTouchUpInside];
    [loginView addSubview:forgetbutton];
    
    
    
}

//账号密码登录方法
- (void)setupUserorPass{
    
    //账号密码底部View
    UIView * userView = [[UIView alloc] init];
    userView.frame = CGRectMake(0, CGRectGetMaxY(self.selectButton.frame)  + 200 * px, ScreenWidth, 100);
    [self.loginView addSubview:userView];
    self.userView = userView;
    //手机提示图片
    
    CGFloat iphoneimageW = 120 * px;
    UIImageView * iphoneimage = [[UIImageView alloc] init];
    iphoneimage.image = [UIImage imageNamed:@"iphone"];
    iphoneimage.frame = CGRectMake(120 * px, 20 * px, iphoneimageW, iphoneimageW);
    [userView addSubview:iphoneimage];
    
    ////////////////
    //账号输入框/////
    ///////////////
    UITextField * usertexfield = [[UITextField alloc] init];
    usertexfield.frame = CGRectMake(CGRectGetMaxX(iphoneimage.frame) + 30 * px, iphoneimage.y, ScreenWidth - iphoneimageW * 4, iphoneimageW);
    usertexfield.text = @"17610697385";
    [userView addSubview:usertexfield];
    self.userTexField = usertexfield;
    
    //手机提示线
    UIView * lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(usertexfield.frame) + 5 * px, usertexfield.width, 1);
    lineView.backgroundColor = WYCRGBColor(251, 247, 237);
    [userView addSubview:lineView];
    
    
    ////////////////
    /////密码输入框/////
    ///////////////
    
    //手机提示图片
    
    CGFloat passimageW = iphoneimageW;
    UIImageView * passimage = [[UIImageView alloc] init];
    passimage.image = [UIImage imageNamed:@"password"];
    passimage.frame = CGRectMake(120 * px, CGRectGetMaxY(lineView.frame) + 80 * px, passimageW, passimageW);
    [userView addSubview:passimage];
    
    
    UITextField * passtexfield = [[UITextField alloc] init];
    passtexfield.frame = CGRectMake(CGRectGetMaxX(passimage.frame) + 30 * px, passimage.y, ScreenWidth - iphoneimageW * 4, passimageW);
    passtexfield.secureTextEntry = YES;
    passtexfield.text = @"000000";
    [userView addSubview:passtexfield];
    self.passTexField = passtexfield;
    //密码提示线
    UIView * passlineView = [[UIView alloc] init];
    passlineView.frame = CGRectMake(passtexfield.x, CGRectGetMaxY(passtexfield.frame) + 5 * px, usertexfield.width, 1);
    passlineView.backgroundColor = WYCRGBColor(251, 247, 237);
    [userView addSubview:passlineView];
    
}
//点击切换方法
- (void)loginClick:(UIButton *)button{
    
    self.selectButton.enabled = YES;
    button.enabled = NO;
    self.selectButton = button;
    
    //动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = button.width / 6;
        self.indicatorView.centerX  = button.centerX;
    }];
    [self setcodeView];
}
//验证码登录
- (void)setcodeView{
    
    WYCLog(@"-------------------");
    self.userView.hidden = YES;
    //账号密码底部View
    UIView * codeView = [[UIView alloc] init];
    codeView.frame = CGRectMake(0, CGRectGetMaxY(self.selectButton.frame)  + 200 * px, ScreenWidth, 100);
    //    userView.backgroundColor  = [UIColor redColor];
    [self.loginView addSubview:codeView];
    self.codeView = codeView;
    //手机提示图片

    CGFloat iphoneimageW = 120 * px;
    UIImageView * iphoneimage = [[UIImageView alloc] init];
    iphoneimage.image = [UIImage imageNamed:@"iphone"];
    iphoneimage.frame = CGRectMake(120 * px, 20 * px, iphoneimageW, iphoneimageW);
    [codeView addSubview:iphoneimage];

    ////////////////
    //账号输入框/////
    ///////////////
    UITextField * usertexfield = [[UITextField alloc] init];
    usertexfield.frame = CGRectMake(CGRectGetMaxX(iphoneimage.frame) + 30 * px, iphoneimage.y, ScreenWidth - iphoneimageW * 4, iphoneimageW);
    //    usertexfield.backgroundColor = [UIColor redColor];
    usertexfield.text = @"17610697385";
    [codeView addSubview:usertexfield];

    //手机提示线
    UIView * lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(usertexfield.frame) + 5 * px, usertexfield.width, 1);
    lineView.backgroundColor = WYCRGBColor(233, 162, 21);
    [codeView addSubview:lineView];


    ///////////////////
    //////密码输入框/////
    ///////////////////

    
    UITextField * codefield = [[UITextField alloc] init];
    codefield.frame = CGRectMake(usertexfield.x, CGRectGetMaxY(lineView.frame) + 100 * px, ScreenWidth - iphoneimageW * 4 - 350 * px, iphoneimageW);
    codefield.placeholder = @"输入验证码";
    [codeView addSubview:codefield];

    //手机提示线
    UIView * passlineView = [[UIView alloc] init];
    passlineView.frame = CGRectMake(codefield.x, CGRectGetMaxY(codefield.frame) + 5 * px, codefield.width, 1);
    passlineView.backgroundColor = WYCRGBColor(233, 162, 21);
    [codeView addSubview:passlineView];
    
    //获取验证码
    UIButton * codebutton = [[UIButton alloc] init];
    codebutton.frame = CGRectMake(CGRectGetMaxX(codefield.frame), codefield.y, 350 * px, codefield.height);
    [codebutton setTitleColor:WYCRGBColor(233, 162, 21) forState:UIControlStateNormal];
    [codebutton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [codeView addSubview:codebutton];
    
    
    
}
// 立即注册方法
- (void)registerClick{
    WYCRigsterController * rigster = [[WYCRigsterController alloc] init];
    [self presentViewController:rigster animated:NO completion:nil];
}
- (void)forgetClick{
    WYCForgetController * forget = [[WYCForgetController alloc] init];
    [self presentViewController:forget animated:NO completion:nil];
    
}


//登录按钮操作
- (void)loginClick{
    
    WYCLog(@"----------------------------->>>>>>>>>>");
    /**********判断是否为空**********/
    if (self.userTexField.text.length == 0){
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"手机号不能为空"];
        return;
    }
    if (self.passTexField.text.length == 0){
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"密码不能为空"];
        return;
    }
    
    
    //RSA密码加密
    NSString * passStr = [NSString stringWithFormat:@"%@",self.passTexField.text];
    NSString *pas = [RSAUtil encryptString:passStr publicKey:RSA_P_KEY];
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"mobile"] = self.userTexField.text;
    
    
    //使用RSA加密操作的暗文
    params[@"password"] = pas;
//    [HttpTool postWithURLString:Login parameters:params success:^(NSDictionary *data) {
//        WYCLog(@"========>>>%@",data);
//        WYCLog(@"----->>>%@",data[@"msg"]);
//        if ([[data objectForKey:@"code"] intValue] == 0){
//            
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//            
//            NSDictionary * dict = [data objectForKey:@"result"];
//            
//        if ([[dict objectForKey:@"regState"] intValue] == 0 || [[dict objectForKey:@"regState"] intValue] == 1 || [[dict objectForKey:@"regState"] intValue] == 2 || [[dict objectForKey:@"regState"] intValue] == 3 || [[dict objectForKey:@"regState"] intValue] == 4 || [[dict objectForKey:@"regState"] intValue] == 5) {
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请实名认证"];
//            WYCAccount * Account = [[WYCAccount alloc] initWithDic:dict];
//            
//            [WYCAccountTool saveAccount:Account];
//            
//            [WYCIsAppLoginTool saveIsAppLogin:YES];
//            
//            WYCLog(@"------------->>>>>>>>%@",[WYCAccountTool unarchiveticket]);
//            WYCAuthenticationController * auther = [[WYCAuthenticationController alloc] init];
//            [self presentViewController:auther animated:NO completion:nil];
//            
//            }else{
//            
//            WYCAccount * Account = [[WYCAccount alloc] initWithDic:dict];
//            
//            [WYCAccountTool saveAccount:Account];
//            
//            [WYCIsAppLoginTool saveIsAppLogin:YES];
//            
//            XMGTabBarController * TaBbar = [[XMGTabBarController alloc] init];
//                [self presentViewController:TaBbar animated:YES completion:nil];
//        }
//            
//        }else{
//            
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//        
//        }
//    } failure:^(NSError *error) {
//        
//    }];

    
}
@end
