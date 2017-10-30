//
//  WYCBankCardController.m
//  初试
//
//  Created by 李胜军 on 2017/10/23.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCBankCardController.h"
#import "WYCCityController.h"
#import "WYCCityModel.h"
#import "WYCprovinceModel.h"
#import "WYCPickerView.h"
#import <MJExtension.h>
@interface WYCBankCardController ()
/** 电话*/
@property (strong , nonatomic) UITextField *mobileField;

/** 省按钮*/
@property (strong , nonatomic) UIButton * provincebutton;

/** 省View*/
@property (strong , nonatomic) UIView *provinceView;


/** 市View*/
@property (strong , nonatomic) UIView *cityView;


/** 省数组*/
@property (strong , nonatomic) NSMutableArray *provincearray;


/** 市数组*/
@property (strong , nonatomic) NSMutableArray *cityarray;

/** 选择器*/
@property (strong , nonatomic) UIPickerView *pickerView;


/** 市选择器*/
@property (strong , nonatomic) UIPickerView *citypickerView;


/** 省选择*/
@property (strong , nonatomic) UITextField *provinceField;


/** 省*/
@property (strong , nonatomic) UILabel * provincelabel;

/** 市选择*/
@property (strong , nonatomic) UITextField *cityField;


/** 市label*/
@property (strong , nonatomic) UILabel * citylabel;

/** name*/
@property (strong , nonatomic) NSString *provincename;
/** id*/
@property (strong , nonatomic) NSString *provinceID;

/** 市模型*/
@property (strong , nonatomic) WYCprovinceModel *provinceModel;
/** 省市模型*/
@property (strong , nonatomic) WYCCityModel *CityModel;

@property (nonatomic, strong) WYCPickerView *addressView;


@property (nonatomic, strong) UIToolbar *toolBar;

@end

@implementation WYCBankCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //界面
    [self setupNav];
    
    
    self.addressView = [[WYCPickerView alloc] init];
    self.provinceField.inputView = self.addressView;
    self.provinceField.inputAccessoryView = self.toolBar;
    _cityField.inputView = self.addressView;
    _cityField.inputAccessoryView = self.toolBar;
    
//    [self setupcity];
    
    //省数组初始化
    self.provincearray = [[NSMutableArray alloc] init];
    
    //市数组初始化
    self.cityarray = [[NSMutableArray alloc] init];
    
    [self setupprovince];
   
//    [self setupcity];
    
}
//请求市
- (void)setupcity{
    
//    NSMutableDictionary * params = [NSMutableDictionary dictionary];
//    params[@"id"] = @"110000";
//    [HttpTool postWithURLString:AddressList parameters:params success:^(NSDictionary *data) {
//        if ([[data objectForKey:@"code"] intValue] == 0) {
//            WYCLog(@"============%@",data);
//            NSArray * dataArray = data[@"result"];
//            for (NSDictionary * dict in dataArray) {
//                WYCCityModel * cityModel = [WYCCityModel mj_objectWithKeyValues:dict];
//                [self.cityarray addObject:cityModel.name];
//            }
//
//        }else{
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//
//        }
//    } failure:^(NSError *error) {
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//    }];
}

//请求省
- (void)setupprovince{
    
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"id"] = @"0";
    
    NSString * str = @"http://ccp.winzhong.net/address/list?id=0";
//    [HttpTool postWithURLString:str parameters:nil success:^(NSDictionary *data) {
//
//    } failure:^(NSError *error) {
//        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//    }];
    [HttpTool POST:str params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        WYCLog(@"请求是否为%@",responseObject);
        if ([[responseObject objectForKey:@"code"] intValue] == 0) {
        WYCLog(@"============%@",responseObject);
        NSArray * dataArray = responseObject[@"result"];
        for (NSDictionary * dict in dataArray) {
            WYCCityModel * cityModel = [WYCCityModel mj_objectWithKeyValues:dict];
            [self.provincearray addObject:cityModel.name];
        }

    }else{
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
        
    }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

//布局界面
- (void)setupNav {
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
    NavRigsterLabel.text = @"银行卡绑定";
    [registerView addSubview:NavRigsterLabel];
    
    
    
    //返回按钮
    UIButton *  backbutton = [[UIButton alloc] init];
    [backbutton setImage:[UIImage imageNamed:@"Nav_back"] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    backbutton.frame = CGRectMake(40 * px, NavRigsterLabel.height / 3 - 30 * px, 40 , 40);
    [registerView addSubview:backbutton];
    
    
    
    
    //照片
    
    WYCLog(@"========%@",self.bankCardUrl);
    UIImageView * iphoneimage = [[UIImageView alloc] init];
//    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.bankCardUrl]];
//    iphoneimage.image = [UIImage imageWithData:data];
    iphoneimage.frame = CGRectMake(40 * px, CGRectGetMaxY(registerView.frame) + 40 * px, ScreenWidth - 80 * px, 600 * px);
    [self.view addSubview:iphoneimage];
    
    
    //姓名
    UILabel * nameLbel = [[UILabel alloc] init];
    nameLbel.text = @"银行卡号:";
    nameLbel.font = [UIFont systemFontOfSize:BigMiddleFont];
    nameLbel.textColor = WYCRGBColor(120, 112, 115);
    nameLbel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(iphoneimage.frame) + 80 * px, 300 * px, 60 * px);
    [self.view addSubview:nameLbel];
    
    
    //+1
    UITextField * nameField = [[UITextField alloc] init];
    nameField.frame = CGRectMake(CGRectGetMaxX(nameLbel.frame) + 20 * px, nameLbel.y, ScreenWidth, nameLbel.height);
    nameField.font = [UIFont systemFontOfSize:BigMiddleFont];
//    nameField.text = self.cardNumber;
    nameField.textColor = WYCRGBColor(120, 112, 115);
    [self.view addSubview:nameField];
    
    
    
    //开户银行
    UILabel * sexlabel = [[UILabel alloc] init];
    sexlabel.text = @"开户银行:";
    sexlabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    sexlabel.textColor = WYCRGBColor(120, 112, 115);
    sexlabel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(nameLbel.frame) + 80 * px, nameLbel.width, 60 * px);
    [self.view addSubview:sexlabel];
    
    
    //性别
    UITextField * sexField = [[UITextField alloc] init];
    sexField.frame = CGRectMake(CGRectGetMaxX(sexlabel.frame) + 20 * px, sexlabel.y, ScreenWidth, sexlabel.height);
    sexField.font = [UIFont systemFontOfSize:BigMiddleFont];
    
//    sexField.text = [NSString stringWithFormat:@"%@",self.bankName];

    sexField.textColor = WYCRGBColor(120, 112, 115);
    [self.view addSubview:sexField];
    
    
    //选择省
    UILabel * provincelabel = [[UILabel alloc] init];
    provincelabel.text = @"选择省:";
    provincelabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    provincelabel.textColor = WYCRGBColor(120, 112, 115);
    provincelabel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(sexlabel.frame) + 80 * px, nameLbel.width, 60 * px);
    [self.view addSubview:provincelabel];
    self.provincelabel = provincelabel;
    
    
    
    _provinceField = [[UITextField alloc] init];
    _provinceField.frame = CGRectMake(CGRectGetMaxX(_provincelabel.frame) + 20 * px, _provincelabel.y, ScreenWidth, _provincelabel.height);
    _provinceField.font = [UIFont systemFontOfSize:BigMiddleFont];
    _provinceField.backgroundColor = [UIColor redColor];
//    _provinceField.enabled = NO;
    [self.view addSubview:_provinceField];
    
    
    //选择省
    UILabel * citylabel = [[UILabel alloc] init];
    citylabel.text = @"选择市:";
    citylabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    citylabel.textColor = WYCRGBColor(120, 112, 115);
    citylabel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(provincelabel.frame) + 80 * px, nameLbel.width, 60 * px);
    [self.view addSubview:citylabel];
    
    
    
    _cityField = [[UITextField alloc] init];
    _cityField.frame = CGRectMake(CGRectGetMaxX(citylabel.frame) + 20 * px, citylabel.y, ScreenWidth, citylabel.height);
    _cityField.font = [UIFont systemFontOfSize:BigMiddleFont];
    _cityField.backgroundColor = [UIColor redColor];
    //    _provinceField.enabled = NO;
    [self.view addSubview:_cityField];
    
//    UIButton * citybutton = [[UIButton alloc] init];
//    citybutton.frame = CGRectMake(CGRectGetMaxX(citylabel.frame) + 20 * px, citylabel.y, ScreenWidth, citylabel.height);
//        citybutton.backgroundColor = [UIColor redColor];
//    [citybutton addTarget:self action:@selector(citybuttonClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:citybutton];
    
    //住址
    UILabel * Reservelabel = [[UILabel alloc] init];
    Reservelabel.text = @"预留手机号:";
    Reservelabel.font = [UIFont systemFontOfSize:BigMiddleFont];
    Reservelabel.textColor = WYCRGBColor(120, 112, 115);
    Reservelabel.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(citylabel.frame) + 80 * px, nameLbel.width + 60 * px, 60 * px);
    [self.view addSubview:Reservelabel];
    
    
    //性别
    UITextField * mobileField = [[UITextField alloc] init];
    mobileField.frame = CGRectMake(CGRectGetMaxX(Reservelabel.frame) + 20 * px, Reservelabel.y, ScreenWidth, Reservelabel.height);
    mobileField.font = [UIFont systemFontOfSize:BigMiddleFont];
//    addressField.text = self.bankId;
    mobileField.textColor = WYCRGBColor(120, 112, 115);
    [self.view addSubview:mobileField];
    self.mobileField = mobileField;
    
    
    
    //登录按钮
    UIButton * loginButton = [[UIButton alloc] init];
    loginButton.frame = CGRectMake(iphoneimage.x, CGRectGetMaxY(Reservelabel.frame) + 80 * px, ScreenWidth - iphoneimage.x * 2, 200 * px);
    loginButton.backgroundColor = WYCRGBColor(239, 177, 22);
    loginButton.layer.cornerRadius = 100 * px;
    [loginButton setTitle:@"确认保存" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:72 * px];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}
- (UIToolbar *)toolBar{
    
    WYCLog(@"==============================");
    if (_toolBar == nil) {
        self.toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        _toolBar.barTintColor=[UIColor whiteColor];
        UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(hideclick)];
        UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
        _toolBar.items = @[item1, item2];
    }
    return _toolBar;
}

- (void)hideclick{
    self.provinceField.inputView = nil;
    self.provinceField.inputAccessoryView = nil;
    [self.provinceField  resignFirstResponder];
    [self.provinceField becomeFirstResponder];
}
- (void)click{
    if (_provinceField.isFirstResponder) {
        [_provinceField resignFirstResponder];
        self.provinceField.text = [NSString stringWithFormat:@"%@",self.addressView.province];
        self.provinceID = self.addressView.cityID;
        _cityField.text = [NSString stringWithFormat:@"%@",self.addressView.province];
        WYCLog(@"城市ID%@",self.provinceID);
    }
}

//保存
- (void)loginClick{
    
    
    if (self.mobileField.text.length == 0) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"预留手机号不能为空"];
        return;
    }
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    
    
    params[@"userId"] = [WYCAccountTool unarchiveuserId];
    params[@"ticket"] = [WYCAccountTool unarchiveticket];
    params[@"cardNumber"] = self.cardNumber;
    params[@"bankId"] = self.bankId;
    params[@"provinceId"] = self.bankId;
    params[@"cityId"] = self.bankId;
    params[@"mobile"] = self.mobileField.text;
//    [HttpTool postWithURLString:saveDebitCard parameters:params success:^(NSDictionary *data) {
//        if ([[data objectForKey:@"code"] intValue] == 0) {
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//            }else{
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//            
//            }
//    } failure:^(NSError *error) {
//        
//    }];

    
}

//选择省
- (void)provincebuttonClick{
    
    WYCPickerView * picker = [[WYCPickerView alloc] initWithFrame:self.view.bounds];
   

    [self.view addSubview:picker];
    
    
    
}

//选择市
- (void)citybuttonClick{
    WYCLog(@"=================");
    
    WYCPickerView * picker = [[WYCPickerView alloc] initWithFrame:self.view.bounds];
    
    
    [self.view addSubview:picker];
    
    
}

//销毁控制器返回上一级
- (void)backClick{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}


@end
