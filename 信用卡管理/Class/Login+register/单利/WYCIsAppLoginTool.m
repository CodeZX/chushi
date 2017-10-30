//
//  WYCIsAppLoginTool.m
//  初试
//
//  Created by 中企互联 on 2017/10/19.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import "WYCIsAppLoginTool.h"

#define AccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"isAppLogin.data"]

@implementation WYCIsAppLoginTool



+ (void)saveIsAppLogin:(BOOL)isAppLogin {
    
    
    NSString *login = [NSString stringWithFormat:@"%d", isAppLogin];
    [NSKeyedArchiver archiveRootObject:login toFile:AccountFile];
}

+ (BOOL)unarchiveIsAppLogin {
    
    NSString *isAppLogin = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountFile];
    
    return [isAppLogin boolValue];
}

+ (void)clearIsAppLogin {
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    [manager removeItemAtPath:AccountFile error:nil];
}

//从文件解析对象的时候调用
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        self.isAppLogin = [aDecoder decodeBoolForKey:@"isAppLogin"];
        
        
        
    }
    return self;
}
//将对象写入文件的时候调用
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeBool:self.isAppLogin forKey:@"isAppLogin"];
    
    
}
@end
