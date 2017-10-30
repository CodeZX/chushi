//
//  WYCIsAppLoginTool.h
//  初试
//
//  Created by 中企互联 on 2017/10/19.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYCIsAppLoginTool : NSObject


@property (nonatomic, assign) BOOL isAppLogin;

//需要存储的账号信息
+(void)saveIsAppLogin:(BOOL)isAppLogin;
//返回要存储的账号信息

+ (void)clearIsAppLogin;

+ (BOOL)unarchiveIsAppLogin;
@end
