

//
//  WYCBindingIDSideController.m
//  初试
//
//  Created by 李胜军 on 2017/10/23.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCBindingIDSideController.h"

@interface WYCBindingIDSideController ()

@end

@implementation WYCBindingIDSideController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //界面
    [self setupNav];
}
- (void)setupNav{
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
NavRigsterLabel.text = @"身份证反面";
[registerView addSubview:NavRigsterLabel];



//返回按钮
UIButton *  backbutton = [[UIButton alloc] init];
[backbutton setImage:[UIImage imageNamed:@"Nav_back"] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
backbutton.frame = CGRectMake(40 * px, NavRigsterLabel.height / 3 - 30 * px, 40 , 40);
[registerView addSubview:backbutton];





//照片

UIImageView * iphoneimage = [[UIImageView alloc] init];
NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.faceUrl]];
iphoneimage.image = [UIImage imageWithData:data];
iphoneimage.frame = CGRectMake(40 * px, CGRectGetMaxY(registerView.frame) + 40 * px, ScreenWidth - 80 * px, 600 * px);
[self.view addSubview:iphoneimage];
    
    
    //签发机关
    UILabel * signinglabel = [[UILabel alloc] init];
    signinglabel.text = @"签发机关：";
    signinglabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    signinglabel.textColor = WYCRGBColor(120, 112, 115);
    signinglabel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(iphoneimage.frame) + 80 * px, 320 * px, 60 * px);
    [self.view addSubview:signinglabel];
    
    //+1
    UITextField * signingField = [[UITextField alloc] init];
    signingField.frame = CGRectMake(CGRectGetMaxX(signinglabel.frame) + 20 * px, signinglabel.y, ScreenWidth, signinglabel.height);
    signingField.font = [UIFont systemFontOfSize:BigMiddleFont];
    signingField.text = self.signingstr;
    signingField.textColor = WYCRGBColor(120, 112, 115);
    [self.view addSubview:signingField];
    
    
    
    //有效期
    UILabel * Termlabel = [[UILabel alloc] init];
    Termlabel.text = @"有限期:";
    Termlabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    Termlabel.textColor = WYCRGBColor(120, 112, 115);
    Termlabel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(signinglabel.frame) + 80 * px, 240 * px, 60 * px);
    [self.view addSubview:Termlabel];
    
    
    //性别
    UITextField * TermField = [[UITextField alloc] init];
    TermField.frame = CGRectMake(CGRectGetMaxX(Termlabel.frame) + 20 * px, Termlabel.y, ScreenWidth, Termlabel.height);
    TermField.font = [UIFont systemFontOfSize:BigMiddleFont];
    NSArray *stararray = [self.startimestr componentsSeparatedByString:@" "];
    NSArray *endarray = [self.endtimestr componentsSeparatedByString:@" "];
    NSString * str = [NSString stringWithFormat:@"%@-%@",stararray[0],endarray[0]];
    TermField.text = str;
    TermField.textColor = WYCRGBColor(120, 112, 115);
    [self.view addSubview:TermField];
    
    //登录按钮
    UIButton * loginButton = [[UIButton alloc] init];
    loginButton.frame = CGRectMake(Termlabel.x, CGRectGetMaxY(Termlabel.frame) + 80 * px, ScreenWidth - Termlabel.x * 2, 200 * px);
    loginButton.backgroundColor = WYCRGBColor(239, 177, 22);
    loginButton.layer.cornerRadius = 100 * px;
    [loginButton setTitle:@"确认保存" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:72 * px];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
}

//保存操作
- (void)loginClick{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"cardId"] = @"";
    params[@"name"] = @"";
    params[@"sex"] = @"";
    params[@"nationality"] = @"";
    params[@"birth"] = @"";
    params[@"address"] = @"";
    params[@"num"] = @"";
    params[@"faceUrl"] = @"";
    params[@"headUrl"] = @"";
    params[@"holdIdCardUrl"] = @"";
    params[@"num"] = @"";
    /**********为空就行**********/
    
    params[@"userId"] = [WYCAccountTool unarchiveuserId];
    params[@"ticket"] = [WYCAccountTool unarchiveticket];;
    params[@"issue"] = self.signingstr;
    params[@"startDate"] = self.startimestr;
    params[@"endDate"] = self.endtimestr;
    params[@"backUrl"] = self.faceUrl;
//    [HttpTool postWithURLString:saveIdCardback parameters:params success:^(NSDictionary *data) {
//        if ([[data objectForKey:@"code"] integerValue] == 0) {
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"保存成功"];
//            
//            }else{
//            
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//            
//            }
//    } failure:^(NSError *error) {
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//    }];

    
}
//返回按钮
- (void)backClick{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
