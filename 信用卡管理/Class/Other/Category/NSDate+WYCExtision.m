//
//  NSDate+WYCExtision.m
//  百思不得姐
//
//  Created by 周鑫 on 16/3/3.
//  Copyright © 2016年 WYC. All rights reserved.
//

#import "NSDate+WYCExtision.h"

@implementation NSDate (WYCExtision)
/**
 *比较from和self的时间值
 */
- (NSDateComponents *)deltaWithNow
{
    
    //日历
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    //比较时间
    NSCalendarUnit Unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
       return [calendar components:Unit fromDate:self toDate:[NSDate date] options:0];
}
//是否为今年
- (BOOL)isThisYear
{
//    NSDate * now = [NSDate date];
    //日历
    NSCalendar  *calendar = [NSCalendar currentCalendar];
    
    int unit  = NSCalendarUnitYear;
    int selfYear  = [calendar component:NSCalendarUnitYear fromDate:self];
    
    NSDateComponents * nowcmps = [calendar components:unit fromDate:[NSDate date]];
    
    
    NSDateComponents * selfcmps = [calendar components:unit fromDate:self];
    return nowcmps.year == selfcmps.year;
}


-(BOOL)isToday
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    int unit =  NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth;
    
     NSDateComponents * nowcmps = [calendar components:unit fromDate:[NSDate date]];
    
    
    NSDateComponents * selfcmps = [calendar components:unit fromDate:self];
    
    return (selfcmps.year == nowcmps.year) && (selfcmps.month == nowcmps.month) && (selfcmps.day == nowcmps.day);
}

- (BOOL)isYesterTerday
{
    //日期格式类
    NSDateFormatter * fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSDate * nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate * selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * cmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;

}
@end
