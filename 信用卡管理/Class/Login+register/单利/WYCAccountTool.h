//
//  WYCAccountTool.h
//  初试
//
//  Created by 中企互联 on 2017/10/19.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WYCAccount;

@interface WYCAccountTool : NSObject

//需要存储的账号信息
+(void)saveAccount:(WYCAccount *)account;

+ (NSString *)unarchivebankName;

+ (NSString *)unarchivecardNumber;

+ (NSString *)unarchivecreateTime;

+ (NSString *)unarchiveidnumber;

+ (NSString *)unarchivelastLoginTime;

+ (NSString *)unarchivemobile;

+ (NSString *)unarchivetoken;

+ (NSString *)unarchiveuserName;

+ (NSString *)unarchiveticket;

+ (NSString *)unarchiveuserId;
@end
