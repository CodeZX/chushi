//
//  WYCAccountTool.m
//  初试
//
//  Created by 中企互联 on 2017/10/19.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCAccountTool.h"
#import "WYCAccount.h"
#define AccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]
@implementation WYCAccountTool

+(void)saveAccount:(WYCAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:AccountFile];
}


+(WYCAccount *)account
{
    //取出账号
    WYCAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountFile];
    return account;
}


+ (NSString *)unarchivebankName {
    
    return [self account].bankName;
}

+ (NSString *)unarchivecardNumber{
    
    return [self account].cardNumber;
}

+ (NSString *)unarchivecreateTime{
    
    return [self account].createTime;
}

+ (NSString *)unarchiveidnumber{
    
    return [self account].idnumber;
}

+ (NSString *)unarchivelastLoginTime{
    
    return [self account].lastLoginTime;
}

+ (NSString *)unarchivemobile{
    
    return [self account].mobile;
}

+ (NSString *)unarchivetoken{
    
    return [self account].token;
}

+ (NSString *)unarchiveuserName{
    
    return [self account].userName;
}
+ (NSString *)unarchiveuserId{
    
    return [self account].userId;
}
+ (NSString *)unarchiveticket{
    
    return [self account].ticket;
}
+ (void)clearAccount {
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    [manager removeItemAtPath:AccountFile error:nil];
}
@end
