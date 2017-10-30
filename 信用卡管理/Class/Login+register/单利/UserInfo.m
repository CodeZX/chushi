//
//  UserInfo.m
//  记忆力检测
//
//  Created by tongyanan on 15/9/11.
//  Copyright (c) 2015年 企携科技. All rights reserved.
//

#import "UserInfo.h"
#import "SVProgressHUD.h"
#import "WYCLoginController.h"

#define bankNameKey @"bankName"


#define cardNumberKey @"cardNumber"


#define createTimeKey @"createTime"


#define idnumberKey @"idnumber"


#define lastLoginTimeKey @"lastLoginTime"


#define mobileKey @"mobile"


#define tokenKey @"token"


#define IsLogin @"IsLogin"


#define userNameKey @"userName"


#define USERM

@implementation UserInfo
singleton_implementation(UserInfo)

// 保存数据
- (void)saveUserInfoToSanbox{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    //1.保存用户登录状态
    [userDefault setBool:self.loginStatus forKey:IsLogin];
    
    //2.保存u银行昵称
    [userDefault setObject:self.bankName forKey:bankNameKey];
    
    //3.保存银行卡密码
    [userDefault setObject:self.cardNumber forKey:cardNumberKey];
    
    
    //4.保存创建时间
    [userDefault setObject:self.createTime forKey:createTimeKey];

    
    //5.保存id
    [userDefault setObject:self.idnumber forKey:idnumberKey];
    
    //6.保存xx
    [userDefault setObject:self.lastLoginTime forKey:lastLoginTimeKey];
    
    
    //8.保存手机号
    [userDefault setObject:self.mobile forKey:mobileKey];
    
    //9.保存token
    [userDefault setObject:self.token forKey:tokenKey];
    
    //10.保存姓名
    [userDefault setObject:self.userName forKey:userNameKey];
    
    
}



// 取数据
- (void)loadUserInfoFromSanbox{
    //1.读取登录状态
    self.loginStatus = [[NSUserDefaults standardUserDefaults] boolForKey:IsLogin];
    
    //2.读取银行昵称
    self.bankName =  [[NSUserDefaults standardUserDefaults] objectForKey:bankNameKey];
    
    //3.读取卡号
    self.cardNumber = [[NSUserDefaults standardUserDefaults] objectForKey:cardNumberKey];
    
    
    //4.读取创建时间
    self.createTime = [[NSUserDefaults standardUserDefaults] objectForKey:createTimeKey];
    
    
    //5.读取id
    self.idnumber = [[NSUserDefaults standardUserDefaults] objectForKey:idnumberKey];
    
    //6.读取lastLoginTime
    self.lastLoginTime = [[NSUserDefaults standardUserDefaults] objectForKey:lastLoginTimeKey];
    
    
    //8.读取手机号
    self.mobile = [[NSUserDefaults standardUserDefaults] objectForKey:mobileKey];
    
    
    //9.读取=标识
    self.token = [[NSUserDefaults standardUserDefaults] objectForKey:tokenKey];
    
    
    //10.读取昵称
    self.userName = [[NSUserDefaults standardUserDefaults] objectForKey:userNameKey];
    

}





/**
 *  登陆工具
 */
- (void)showLoginViewWith:(UIViewController *)object {
    
    [SVProgressHUD showErrorWithStatus:@"您以被迫下线，请重新登录！"];
    WYCLoginController *loginVC = [[WYCLoginController alloc] init];
    [object presentViewController:loginVC animated:YES completion:nil];
    
}

@end
