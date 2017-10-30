


//
//  WYCBindingIDController.m
//  初试
//
//  Created by 李胜军 on 2017/10/20.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCBindingIDController.h"
#import "WYCAuthenticationController.h"
#import "WYCAccount.h"
#import <SVProgressHUD.h>
@interface WYCBindingIDController ()

@end

@implementation WYCBindingIDController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    WYCLog(@"==============>>>%@",[UserInfo sharedUserInfo].userName);
    //界面布局
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
    NavRigsterLabel.text = @"绑定身份证";
    [registerView addSubview:NavRigsterLabel];
    
    
    
    //返回按钮
    UIButton *  backbutton = [[UIButton alloc] init];
    [backbutton setImage:[UIImage imageNamed:@"Nav_back"] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    backbutton.frame = CGRectMake(40 * px, NavRigsterLabel.height / 3 - 30 * px, 40 , 40);
    [registerView addSubview:backbutton];
    
    
    
    
    //照片
    
    WYCLog(@"========%@",self.faceUrl);
    UIImageView * iphoneimage = [[UIImageView alloc] init];
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.faceUrl]];
    iphoneimage.image = [UIImage imageWithData:data];
    iphoneimage.frame = CGRectMake(40 * px, CGRectGetMaxY(registerView.frame) + 40 * px, ScreenWidth - 80 * px, 600 * px);
    [self.view addSubview:iphoneimage];
    
    
    //姓名
    UILabel * nameLbel = [[UILabel alloc] init];
    nameLbel.text = @"姓名:";
    nameLbel.font = [UIFont systemFontOfSize:BigMiddleFont];
    nameLbel.textColor = WYCRGBColor(120, 112, 115);
    nameLbel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(iphoneimage.frame) + 80 * px, 150 * px, 60 * px);
    [self.view addSubview:nameLbel];
    
    
    //+1
    UITextField * nameField = [[UITextField alloc] init];
    nameField.frame = CGRectMake(CGRectGetMaxX(nameLbel.frame) + 20 * px, nameLbel.y, ScreenWidth, nameLbel.height);
    nameField.font = [UIFont systemFontOfSize:BigMiddleFont];
    nameField.text = self.name;
    nameField.textColor = WYCRGBColor(120, 112, 115);
    [self.view addSubview:nameField];
    
    
    
    //性别
    UILabel * sexlabel = [[UILabel alloc] init];
    sexlabel.text = @"性别:";
    sexlabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    sexlabel.textColor = WYCRGBColor(120, 112, 115);
    sexlabel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(nameLbel.frame) + 80 * px, nameLbel.width, 60 * px);
    [self.view addSubview:sexlabel];
    
    
    //性别
    UITextField * sexField = [[UITextField alloc] init];
    sexField.frame = CGRectMake(CGRectGetMaxX(sexlabel.frame) + 20 * px, sexlabel.y, ScreenWidth, sexlabel.height);
    sexField.font = [UIFont systemFontOfSize:BigMiddleFont];
    sexField.text = self.sex;
    sexField.textColor = WYCRGBColor(120, 112, 115);
    [self.view addSubview:sexField];
    
    
    //性别
    UILabel * birthlabel = [[UILabel alloc] init];
    birthlabel.text = @"出生:";
    birthlabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    birthlabel.textColor = WYCRGBColor(120, 112, 115);
    birthlabel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(sexlabel.frame) + 80 * px, nameLbel.width, 60 * px);
    [self.view addSubview:birthlabel];


    //性别
    UITextField * birthField = [[UITextField alloc] init];
    birthField.frame = CGRectMake(CGRectGetMaxX(birthlabel.frame) + 20 * px, birthlabel.y, ScreenWidth, birthlabel.height);
    birthField.font = [UIFont systemFontOfSize:BigMiddleFont];
    NSArray *endarray = [self.birth componentsSeparatedByString:@" "];
    birthField.text = [NSString stringWithFormat:@"%@",endarray[0]];
    birthField.textColor = WYCRGBColor(120, 112, 115);
    [self.view addSubview:birthField];
    
    
    //住址
    UILabel * addresslabel = [[UILabel alloc] init];
    addresslabel.text = @"住址:";
    addresslabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    addresslabel.textColor = WYCRGBColor(120, 112, 115);
    addresslabel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(birthlabel.frame) + 80 * px, nameLbel.width, 60 * px);
    [self.view addSubview:addresslabel];
    
    
    //性别
    UITextField * addressField = [[UITextField alloc] init];
    addressField.frame = CGRectMake(CGRectGetMaxX(addresslabel.frame) + 20 * px, addresslabel.y, ScreenWidth, addresslabel.height);
    addressField.font = [UIFont systemFontOfSize:BigMiddleFont];
    addressField.text = self.address;
    addressField.textColor = WYCRGBColor(120, 112, 115);
    [self.view addSubview:addressField];
    
    //证件号
    UILabel * numlabel = [[UILabel alloc] init];
    numlabel.text = @"号码:";
    numlabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    numlabel.textColor = WYCRGBColor(120, 112, 115);
    numlabel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(addresslabel.frame) + 80 * px, nameLbel.width, 60 * px);
    [self.view addSubview:numlabel];
    
    
    //性别
    UITextField * numField = [[UITextField alloc] init];
    numField.frame = CGRectMake(CGRectGetMaxX(numlabel.frame) + 20 * px, numlabel.y, ScreenWidth, numlabel.height);
    numField.font = [UIFont systemFontOfSize:BigMiddleFont];
    numField.text = self.num;
    numField.textColor = WYCRGBColor(120, 112, 115);
    [self.view addSubview:numField];
    
    //登录按钮
    UIButton * loginButton = [[UIButton alloc] init];
    loginButton.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(numlabel.frame) + 80 * px, ScreenWidth - iphoneimage.x * 2, 200 * px);
    loginButton.backgroundColor = WYCRGBColor(239, 177, 22);
    loginButton.layer.cornerRadius = 100 * px;
    [loginButton setTitle:@"确认保存" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:72 * px];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    
}
//保存按钮事件

- (void)loginClick {
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"cardId"] = @"";
    params[@"issue"] = @"";
    params[@"startDate"] = @"";
    params[@"endDate"] = @"";
    params[@"backUrl"] = @"";
    params[@"headUrl"] = @"";
    params[@"holdIdCardUrl"] = @"";
    /**********为空就行**********/
    
    params[@"userId"] = [WYCAccountTool unarchiveuserId];
    params[@"ticket"] = [WYCAccountTool unarchiveticket];;
    params[@"name"] = self.name;
    params[@"sex"] = self.sex;
    params[@"nationality"] = self.nationality;
    params[@"birth"] = self.birth;
    params[@"address"] = self.address;
    params[@"num"] = self.num;
    params[@"faceUrl"] = self.faceUrl;
//    [HttpTool postWithURLString:saveIdCardface parameters:params success:^(NSDictionary *data) {
//        if ([[data objectForKey:@"code"] integerValue] == 0) {
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"保存成功"];
//        
//        }else{
//        
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//        
//        }
//    } failure:^(NSError *error) {
//         [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//    }];

    
}
//返回按钮
- (void)backClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
