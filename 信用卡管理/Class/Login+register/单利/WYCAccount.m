//
//  WYCAccount.m
//  初试
//
//  Created by 中企互联 on 2017/10/19.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCAccount.h"

@implementation WYCAccount
- (instancetype)initWithDic:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    //    if ([key isEqualToString:@"Phone"]) {
    //
    //        self.Phone = value[@"Phone"];
    //    }
}


//从文件解析对象的时候调用
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        
        //2.保存u银行昵称
        self.bankName = [aDecoder decodeObjectForKey:@"bankName"];
        
        //3.保存银行卡密码
        self.cardNumber = [aDecoder decodeObjectForKey:@"cardNumber"];
        
        
        //4.保存创建时间
        self.createTime = [aDecoder decodeObjectForKey:@"createTime"];
        
        
        //5.保存id
        self.idnumber = [aDecoder decodeObjectForKey:@"dnumber"];
        
        //6.保存
        self.lastLoginTime = [aDecoder decodeObjectForKey:@"lastLoginTime"];
        
        
        //8.保存手机号
        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
        
        //9.保存token
        self.token = [aDecoder decodeObjectForKey:@"token"];
        
        
        //10.保存姓名
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        
        self.ticket = [aDecoder decodeObjectForKey:@"ticket"];
        
        self.userId = [aDecoder decodeObjectForKey:@"userId"];
        
    }
    return self;
    
}

//将对象写入文件的时候调用
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    //2.保存u银行昵称
    
    [aCoder encodeObject:self.bankName forKey:@"bankName"];
    
    
    //9.保存token
    if (_login) {
        
        [aCoder encodeObject:self.token forKey:@"token"];
    }else{
        [aCoder encodeObject:@""  forKey:@"token"];
    }
    
    
    //3.保存银行卡密码
    
    [aCoder encodeObject:self.cardNumber forKey:@"cardNumber"];
    
    //4.保存创建时间
    
    
    [aCoder encodeObject:self.createTime forKey:@"createTime"];
    //5.保存id
    
    [aCoder encodeObject:self.idnumber forKey:@"idnumber"];
    //6.保存
    
    [aCoder encodeObject:self.lastLoginTime forKey:@"lastLoginTime"];
    
    //8.保存手机号
    
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    
    
    
    
    //10.保存姓名
    
    [aCoder encodeObject:self.userName forKey:@"userName"];
    
    
    [aCoder encodeObject:self.userId forKey:@"userId"];
    
    
    [aCoder encodeObject:self.ticket forKey:@"ticket"];
    
    
}
@end
