//
//  UserInfo.h
//  记忆力检测
//
//  Created by tongyanan on 15/9/11.
//  Copyright (c) 2015年 徐义恒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"


@interface UserInfo : NSObject

singleton_interface(UserInfo);
/**
 *银行昵称
 */
@property (copy,nonatomic)  NSString *bankName;


/**
 *银行卡号
 */
@property (copy,nonatomic)  NSString *cardNumber;

/**
 *创建时间
 */
@property (copy,nonatomic)  NSString *createTime;


/**
 *xxx
 */
@property (copy,nonatomic)  NSString *idnumber;


/**
 *lastLoginTime
 */
@property (copy,nonatomic)  NSString *lastLoginTime;



/**
 *手机号
 */
@property (copy,nonatomic)  NSString *mobile;



/**
 *唯一标识
 */
@property (copy,nonatomic)  NSString *token;



/**
 *昵称
 */
@property (copy,nonatomic)  NSString *userName;






/**
 *   保存用户信息
 */
@property (strong , nonatomic) NSString * username;

@property (strong , nonatomic) NSString * password;


//yes代表登录过,no代表注销
@property (assign,nonatomic) BOOL loginStatus;


-(void)isLogn;
//保存用户数据到沙盒中去
- (void)saveUserInfoToSanbox;


//从沙河中读取数据
- (void)loadUserInfoFromSanbox;


@end
