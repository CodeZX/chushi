//
//  WYCAuthenticationController.m
//  初试
//
//  Created by 中企互联 on 2017/10/19.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCAuthenticationController.h"
#import "WYCPhotographController.h"

@interface WYCAuthenticationController ()

@end

@implementation WYCAuthenticationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WYCRGBColor(237, 237, 237);
    [self setupNav];
    [self setupCreat];
    
    
    
}
- (void)setupCreat{
    
    //身份证正面
    UIView * idfrontView = [[UIView alloc] init];
    idfrontView.frame = CGRectMake(0, 64, ScreenWidth, 140 * px);
    idfrontView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:idfrontView];
    
    
    UILabel * idfrontLabel = [[UILabel alloc] init];
    idfrontLabel.text = @"身份证正面";
    idfrontLabel.frame = CGRectMake(40 * px, 40 * px, 300 * px, 60 * px);
    idfrontLabel.font = [UIFont systemFontOfSize:MiddleFont];
    [idfrontView addSubview:idfrontLabel];
    
    UIButton * scanningButton = [[UIButton alloc] init];
    scanningButton.frame = CGRectMake(ScreenWidth - 40 * px - 80 * px, idfrontLabel.y, 80 * px, 80 * px);
    [scanningButton setImage:[UIImage imageNamed:@"scanning"] forState:UIControlStateNormal];
    [scanningButton addTarget:self action:@selector(scanninButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [idfrontView addSubview:scanningButton];
    
    
    UIView * idline = [[UIView alloc] init];
    idline.frame = CGRectMake(idfrontLabel.x, idfrontView.height - 1, ScreenWidth, 1);
    idline.backgroundColor = WYCRGBColor(237, 237, 237);
    [idfrontView addSubview:idline];
    
    
    //身份证反面
    UIView * idsideView = [[UIView alloc] init];
    idsideView.frame = CGRectMake(0, CGRectGetMaxY(idfrontView.frame), ScreenWidth, 140 * px);
    idsideView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:idsideView];
    
    
    UILabel * idsideLabel = [[UILabel alloc] init];
    idsideLabel.text = @"身份证反面";
    idsideLabel.frame = CGRectMake(40 * px, 40 * px, 300 * px, 60 * px);
    idsideLabel.font = [UIFont systemFontOfSize:MiddleFont];
    
    
    [idsideView addSubview:idsideLabel];
    
    UIButton * scanningsideButton = [[UIButton alloc] init];
    scanningsideButton.frame = CGRectMake(ScreenWidth - 40 * px - 80 * px, idfrontLabel.y, 80 * px, 80 * px);
    [scanningsideButton setImage:[UIImage imageNamed:@"scanning"] forState:UIControlStateNormal];
    [scanningsideButton addTarget:self action:@selector(scanningsideButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [idsideView addSubview:scanningsideButton];
    
    
    UIView * idsideline = [[UIView alloc] init];
    idsideline.frame = CGRectMake(idfrontLabel.x, idfrontView.height - 1, ScreenWidth, 1);
    idsideline.backgroundColor = WYCRGBColor(237, 237, 237);
    [idsideView addSubview:idsideline];
    
    //手持身份证正面
    UIView * idHoldfrontView = [[UIView alloc] init];
    idHoldfrontView.frame = CGRectMake(0, CGRectGetMaxY(idsideView.frame), ScreenWidth, 140 * px);
    idHoldfrontView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:idHoldfrontView];
    
    
    UILabel * idholdfrontLabel = [[UILabel alloc] init];
    idholdfrontLabel.text = @"手持身份证正面";
    idholdfrontLabel.frame = CGRectMake(40 * px, 40 * px, 400 * px, 60 * px);
    idholdfrontLabel.font = [UIFont systemFontOfSize:MiddleFont];
    [idHoldfrontView addSubview:idholdfrontLabel];
    
    UIButton * scanningholdButton = [[UIButton alloc] init];
    scanningholdButton.frame = CGRectMake(ScreenWidth - 40 * px - 80 * px, idfrontLabel.y, 80 * px, 80 * px);
    [scanningholdButton setImage:[UIImage imageNamed:@"Photograph"] forState:UIControlStateNormal];
    [scanningholdButton addTarget:self action:@selector(scanningholdClick) forControlEvents:UIControlEventTouchUpInside];
    [idHoldfrontView addSubview:scanningholdButton];
    
    
    UIView * idholdfrontline = [[UIView alloc] init];
    idholdfrontline.frame = CGRectMake(idfrontLabel.x, idfrontView.height - 1, ScreenWidth, 1);
    idholdfrontline.backgroundColor = WYCRGBColor(237, 237, 237);
    [idHoldfrontView addSubview:idholdfrontline];
    
    
    //手持身份证反面
    UIView * idHoldsidetView = [[UIView alloc] init];
    idHoldsidetView.frame = CGRectMake(0, CGRectGetMaxY(idHoldfrontView.frame), ScreenWidth, 140 * px);
    idHoldsidetView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:idHoldsidetView];


    UILabel * idholdsideLabel = [[UILabel alloc] init];
    idholdsideLabel.text = @"手持身份证反面";
    idholdsideLabel.frame = CGRectMake(40 * px, 40 * px, 400 * px, 60 * px);
    idholdsideLabel.font = [UIFont systemFontOfSize:MiddleFont];
    [idHoldsidetView addSubview:idholdsideLabel];

    UIButton * scanningholdsideButton = [[UIButton alloc] init];
    scanningholdsideButton.frame = CGRectMake(ScreenWidth - 40 * px - 80 * px, idfrontLabel.y, 80 * px, 80 * px);
    [scanningholdsideButton addTarget:self action:@selector(scanningholdsideClick) forControlEvents:UIControlEventTouchUpInside];
    [scanningholdsideButton setImage:[UIImage imageNamed:@"Photograph"] forState:UIControlStateNormal];
    [idHoldsidetView addSubview:scanningholdsideButton];


    UIView * idholdsideline = [[UIView alloc] init];
    idholdsideline.frame = CGRectMake(idfrontLabel.x, idfrontView.height - 1, ScreenWidth, 1);
    idholdsideline.backgroundColor = WYCRGBColor(237, 237, 237);
    [idHoldsidetView addSubview:idholdsideline];
    
    
    //银行卡正面
    UIView * cardView = [[UIView alloc] init];
    cardView.frame = CGRectMake(0, CGRectGetMaxY(idHoldsidetView.frame) + 30 * px, ScreenWidth, 140 * px);
    cardView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cardView];
    
    
    UILabel * cardLabel = [[UILabel alloc] init];
    cardLabel.text = @"银行卡面";
    cardLabel.frame = CGRectMake(40 * px, 40 * px, 400 * px, 60 * px);
    cardLabel.font = [UIFont systemFontOfSize:MiddleFont];
    [cardView addSubview:cardLabel];
    
    UIButton * cardButton = [[UIButton alloc] init];
    cardButton.frame = CGRectMake(ScreenWidth - 40 * px - 80 * px, idfrontLabel.y, 80 * px, 80 * px);
    [cardButton addTarget:self action:@selector(cardButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [cardButton setImage:[UIImage imageNamed:@"scanning"] forState:UIControlStateNormal];
    [cardView addSubview:cardButton];
    
    
    UIView * cardline = [[UIView alloc] init];
    cardline.frame = CGRectMake(idfrontLabel.x, idfrontView.height - 1, ScreenWidth, 1);
    cardline.backgroundColor = WYCRGBColor(237, 237, 237);
    [cardView addSubview:cardline];
    
    UILabel * showlabel = [[UILabel alloc] init];
    showlabel.frame = CGRectMake(idfrontLabel.x, CGRectGetMaxY(cardView.frame) + 20 * px, ScreenWidth, 60 * px);
    showlabel.text = @"手持身份证请完全漏出手臂,确保身份证号码以及姓名等信息清晰可见";
    showlabel.textColor = WYCRGBColor(87, 86, 236);
    showlabel.font = [UIFont systemFontOfSize:38 * px];
    [self.view addSubview:showlabel];
    
    
    
    
    //提交按钮
    UIButton * loginButton = [[UIButton alloc] init];
    loginButton.frame = CGRectMake(showlabel.x, CGRectGetMaxY(showlabel.frame) + 100 * px, ScreenWidth - showlabel.x * 2, 200 * px);
    loginButton.backgroundColor = WYCRGBColor(239, 177, 22);
    loginButton.layer.cornerRadius = 100 * px;
    [loginButton setTitle:@"提交" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:72 * px];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
}
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
    NavRigsterLabel.text = @"认证信息";
    [registerView addSubview:NavRigsterLabel];
    
    
    
    //返回按钮
    UIButton *  backbutton = [[UIButton alloc] init];
    [backbutton setImage:[UIImage imageNamed:@"Nav_back"] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    backbutton.frame = CGRectMake(40 * px, NavRigsterLabel.height / 3 - 30 * px, 40 , 40);
    [registerView addSubview:backbutton];
}
//返回diss掉控制器

- (void)backClick{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}


- (void)loginClick{
    
    WYCLog(@"==============>>>>>>");
}


//扫描身份证正面
- (void)scanninButtonClick{
    
    WYCLog(@"-------------------->>>>");
    WYCPhotographController * photo = [[WYCPhotographController alloc] init];
    photo.strType = @"1";
    [self presentViewController:photo animated:NO completion:nil];
}
//扫描身份证反面
- (void)scanningsideButtonClick{
    WYCLog(@"-------------");
    WYCPhotographController * photo = [[WYCPhotographController alloc] init];
    photo.strType = @"2";
    [self presentViewController:photo animated:NO completion:nil];
    
}

//身份证正面
- (void)scanningholdClick{
    WYCLog(@"-------------------->>>>");
    WYCPhotographController * photo = [[WYCPhotographController alloc] init];
    photo.strType = @"3";
    [self presentViewController:photo animated:NO completion:nil];
    
}
//身份证反面
- (void)scanningholdsideClick{
    
    WYCPhotographController * photo = [[WYCPhotographController alloc] init];
    photo.strType = @"4";
    [self presentViewController:photo animated:NO completion:nil];
}

//银行卡正面
- (void)cardButtonClick{
    WYCPhotographController * photo = [[WYCPhotographController alloc] init];
    photo.strType = @"5";
    [self presentViewController:photo animated:NO completion:nil];
    
}
@end
