//
//  WYCHttpRequestBaseModel.h
//  信用卡管理
//
//  Created by 中企互联 on 2017/10/30.
//  Copyright © 2017年 李胜军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYCHttpRequestBaseModel : NSObject

@property(nonatomic,assign) NSInteger code;

@property(nonatomic,copy) NSString *msg;

/** 类型是 数组  字典 或者 字符串 */
@property(nonatomic,copy) id data;
@end
