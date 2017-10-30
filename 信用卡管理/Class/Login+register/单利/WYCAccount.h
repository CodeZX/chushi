//
//  WYCAccount.h
//  初试
//
//  Created by 中企互联 on 2017/10/19.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYCAccount : NSObject

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
 *ticket
 */
@property (copy,nonatomic)  NSString *ticket;

/**
 *userId
 */
@property (copy,nonatomic)  NSString *userId;

/** 是否登陆 */
@property(nonatomic,assign,getter=isLogin) BOOL login;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
