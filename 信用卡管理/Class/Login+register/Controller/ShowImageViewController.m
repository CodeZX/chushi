//
//  ShowImageViewController.m
//  photographDemo
//
//  Created by 李胜军 on 2017/10/20.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "ShowImageViewController.h"
#import "WYCBindingIDController.h"
#import "WYCBindingIDSideController.h"
#import "WYCBankCardController.h"
#import "WYCIDHoldController.h"
#import "WYCDebitCardController.h"
#import "WYCCityController.h"

#define kScreenBounds   [UIScreen mainScreen].bounds
#define kScreenWidth  kScreenBounds.size.width*1.0
#define kScreenHeight kScreenBounds.size.height*1.0

@interface ShowImageViewController ()
{
    UIImageView * imageV ;
}

@end

@implementation ShowImageViewController

-(void)setImage:(UIImage *)image{
    
    _image = image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WYCLog(@"=============%@",self.strtype);
    
    imageV = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageV.image = self.image;
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageV];
    
    
    UIButton * done = [[UIButton alloc]initWithFrame:CGRectMake(50, kScreenHeight-100, 100, 40)];
    [done addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
    [done setTitle:@"确定" forState:UIControlStateNormal];
    [done setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:done];
    
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(kScreenWidth-140, kScreenHeight-100, 100, 40);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [cancelBtn setBackgroundColor:[UIColor orangeColor]];
    [cancelBtn addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    
}


-(void)doneClick{
    
    
    if ([self.strtype isEqualToString:@"1"]) {
//        WYCCityController * city = [[WYCCityController alloc] init];
//        [self presentViewController:city animated:NO completion:nil];
        WYCLog(@"========身份证正面=========");
        
        //图片压缩
        NSData * data = UIImageJPEGRepresentation(_image, 1);
        NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];

        NSMutableDictionary * params = [NSMutableDictionary dictionary];
        params[@"base64Img"] = encodedImageStr;
        params[@"side"] = @"1";

//        [HttpTool postWithURLString:ocridcard parameters:params success:^(NSDictionary *data) {
//        if ([[data objectForKey:@"code"] intValue] == 0) {
//        WYCBindingIDController * binding = [[WYCBindingIDController alloc] init];
//        NSDictionary * dict = [data objectForKey:@"result"];
//        //地址
//        binding.address = [dict objectForKey:@"address"];
//
//
//        //出生年月日
//        binding.birth = [dict objectForKey:@"birth"];
//
//
//        //图片
//        binding.faceUrl = [dict objectForKey:@"faceUrl"];
//
//
//        //名字
//        binding.name = [dict objectForKey:@"name"];
//
//        //身份证号
//        binding.num = [dict objectForKey:@"num"];
//
//        //民族
//        binding.nationality = [dict objectForKey:@"nationality"];
//
//
//        //性别
//        binding.sex = [dict objectForKey:@"sex"];
//          [self presentViewController:binding animated:NO completion:nil];
//        }else{
//
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//        }
//        } failure:^(NSError *error) {
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//        }];

    }
    //身份证反面
    else if ([self.strtype isEqualToString:@"2"]) {
        WYCLog(@"========身份证反面=========");
        NSData * data = UIImageJPEGRepresentation(_image, 1);
        NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        NSMutableDictionary * params = [NSMutableDictionary dictionary];
        params[@"base64Img"] = encodedImageStr;
        params[@"side"] = @"2";
//        [HttpTool postWithURLString:ocridcard parameters:params success:^(NSDictionary *data) {
//            if ([[data objectForKey:@"code"] intValue] == 0) {
//
//            WYCBindingIDSideController * side = [[WYCBindingIDSideController alloc] init];
//            NSDictionary * dict = [data objectForKey:@"result"];
//            side.startimestr = [dict objectForKey:@"startDate"];
//            side.endtimestr = [dict objectForKey:@"endDate"];
//            side.faceUrl = [dict objectForKey:@"backUrl"];
//            side.signingstr = [dict objectForKey:@"issue"];
//
//            [self presentViewController:side animated:NO completion:nil];
//
//            }else{
//
//             [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//         }
//
//
//        } failure:^(NSError *error) {
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//        }];
        

        
    }
    //手持身份证正面
    else if ([self.strtype isEqualToString:@"3"]) {
        WYCLog(@"========手持身份证正面=========");
        NSMutableDictionary * params = [NSMutableDictionary dictionary];
        
        NSData * data = UIImageJPEGRepresentation(_image, 1);
        NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        params[@"userId"] = [WYCAccountTool unarchiveuserId];
        params[@"ticket"] = [WYCAccountTool unarchiveticket];
        params[@"base64Img"] = encodedImageStr;
//        [HttpTool postWithURLString:saveIdCardhold parameters:params success:^(NSDictionary *data) {
//            if ([[data objectForKey:@"code"] intValue] == 0) {
//                WYCIDHoldController * idhold = [[WYCIDHoldController alloc] init];
//                [self presentViewController:idhold animated:NO completion:nil];
//            }else{
//
//                [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//            }
//        } failure:^(NSError *error) {
//                [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//        }];
    }
    
    //手持银行卡
    else if ([self.strtype isEqualToString:@"4"]) {
        WYCLog(@"========手持身份证反面=========");
        NSMutableDictionary * params = [NSMutableDictionary dictionary];
        NSData * data = UIImageJPEGRepresentation(_image, 1);
        NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        params[@"userId"] = [WYCAccountTool unarchiveuserId];
        params[@"ticket"] = [WYCAccountTool unarchiveticket];
        params[@"base64Img"] = encodedImageStr;
//        [HttpTool postWithURLString:saveDebitCardhold parameters:params success:^(NSDictionary *data) {
//            if ([[data objectForKey:@"code"] intValue] == 0) {
//                WYCDebitCardController * debit = [[WYCDebitCardController alloc] init];
//                [self presentViewController:debit animated:NO completion:nil];
//            }
//        } failure:^(NSError *error) {
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//        }];
    }
    
    //银行卡正面
    else if ([self.strtype isEqualToString:@"5"]){
        WYCLog(@"========银行卡正面=========");
        NSData * data = UIImageJPEGRepresentation(_image, 1);
        NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        NSMutableDictionary * params = [NSMutableDictionary dictionary];
        params[@"base64Img"] = encodedImageStr;
//        [HttpTool postWithURLString:ocrbankcard parameters:params success:^(NSDictionary *data) {
//            if ([[data objectForKey:@"code"] intValue] == 0) {
//            NSDictionary * dict = [data objectForKey:@"result"];
//            WYCBankCardController * bankcard = [[WYCBankCardController alloc] init];
//            bankcard.bankCardUrl = [dict objectForKey:@"bankCardUrl"];
//                
//            bankcard.bankName = [dict objectForKey:@"bankName"];
//                
//            bankcard.bankId = [dict objectForKey:@"bankId"];
//                
//            bankcard.cardNumber = [dict objectForKey:@"cardNumber"];
//                
//            [self presentViewController:bankcard animated:NO completion:nil];
//                
//            }else{
//                
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msgStr];
//                
//            }
//        } failure:^(NSError *error) {
//             [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
//        }];

              }else {
                  [SVProgressHUD showImage:[UIImage imageNamed:@""] status:Failed];
                  
              }

    
}

-(void)cancle{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}





@end
