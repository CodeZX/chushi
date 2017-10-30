//
//  NSDate+WYCExtision.h
//  百思不得姐
//
//  Created by 周鑫 on 16/3/3.
//  Copyright © 2016年 WYC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WYCExtision)
/**
 *比较from和self的时间差值
 */
- (NSDateComponents *)deltaWithNow;

/**
 *是否为今年
 */
- (BOOL)isThisYear;
/**
 *是否为今天
 */
- (BOOL)isToday;
/**
 *是否为昨天
 */
- (BOOL)isYesterTerday;

@end
