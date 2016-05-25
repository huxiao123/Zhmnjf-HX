//
//  NSDate+MyNSDate.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MyNSDate)

//时间戳转时间
- (NSDate *)dateFormatTranstDate:(NSString *)dateStr;
//求两个时间差
- (NSDateComponents *)getDoubleDateDifferent:(NSDate *)date1 andDate:(NSDate *)date2;

- (NSString *)getTimeStr:(NSString *)fireStr andSate:(NSString *)state;
@end
