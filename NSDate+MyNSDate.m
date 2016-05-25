//
//  NSDate+MyNSDate.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "NSDate+MyNSDate.h"

@implementation NSDate (MyNSDate)
- (NSDate *)dateFormatTranstDate:(NSString *)dateStr{
    
    NSTimeInterval time1 = [dateStr doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time1];
    
    return date;
}

- (NSDateComponents *)getDoubleDateDifferent:(NSDate *)date1 andDate:(NSDate *)date2{
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    unsigned int unitFlags = kCFCalendarUnitYear |
                                kCFCalendarUnitMonth |
                                kCFCalendarUnitDay |
                                kCFCalendarUnitHour |
                                kCFCalendarUnitMinute |
                                kCFCalendarUnitSecond;
    
    NSDateComponents *d = [cal components:unitFlags fromDate:date1 toDate:date2 options:0];
    
//    long sec = [d hour]*3600+[d minute]*60+[d second];
   // NSLog(@"%ld天 %ld小时 %ld分钟 %ld秒",[d day],[d hour],[d minute],[d second]);
    return d;
}

/*
 @param:  fireStr 结束日期
 */
- (NSString *)getTimeStr:(NSString *)fireStr andSate:(NSString *)state
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* fireDate = [formater dateFromString:fireStr];
    NSDate *today = [NSDate date];
    NSDateComponents *d = [self getDoubleDateDifferent:fireDate andDate:today];//计算时间差
//    long hour = [d day] *24 + [d hour];
    NSString *seconds;
    NSString *minutes;
    NSString *hours;
    NSString *day;
    
    if([d second]<10 &&
       [d second]>=0){
        NSLog(@"%ld",[d second]);
        seconds = [MyUnitility deleteline:[NSString stringWithFormat:@"0%ld",[d second]]];}
    else
        seconds = [MyUnitility deleteline:[NSString stringWithFormat:@"%ld",[d second]]];
    if([d minute]<10&&
       [d minute]>=0)
        minutes = [MyUnitility deleteline:[NSString stringWithFormat:@"0%ld",[d minute]]];
    else
        minutes = [MyUnitility deleteline:[NSString stringWithFormat:@"%ld",[d minute]]];
    if([d hour] < 10&&
       [d hour]>=0)
        hours = [MyUnitility deleteline:[NSString stringWithFormat:@"0%ld", [d hour]]];
    else
        hours = [MyUnitility deleteline:[NSString stringWithFormat:@"%ld",[d hour]]];
    if ([d day]<0)
        day = [NSString stringWithFormat:@"00"];
    else
        day = [NSString stringWithFormat:@"%ld",[d day]];
//    NSLog(@"%@",[NSString stringWithFormat:@"%@天 %@小时 %@分钟 %@秒", day,hours, minutes,seconds]);
    
    //防NULL处理
    if (minutes==nil ) {
        minutes = @"60";
    }
    if (seconds==nil) {
        seconds = @"60";
    }
    if (hours==nil) {
        hours = @"0";
    }
    
    
    if ([state isEqualToString:@"1"]){
        if (day==0 &&
            hours==0 &&
            minutes==0 &&
            seconds==0) {
            return [NSString stringWithFormat:@"活动已结束"];
        }

        return [NSString stringWithFormat:@"活动剩余时间：%@天%@小时%@分钟%@秒", day,hours, minutes,seconds];
        
    }else if([state isEqualToString:@"0"]){
        if (day==0 &&
            hours==0 &&
            minutes==0 &&
            seconds==0) {
             return [NSString stringWithFormat:@"活动剩余时间：%@天%@小时%@分钟%@秒", day,hours, minutes,seconds];
        }
        return [NSString stringWithFormat:@"距离预售时间：%@天%@小时%@分钟%@秒", day,hours, minutes,seconds];
    
        }else
         return [NSString stringWithFormat:@"活动已结束"];
}
@end
