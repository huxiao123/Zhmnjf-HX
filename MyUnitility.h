//
//  MyUnitility.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUnitility : NSObject
+ (UIView *)configAlertView:(UIViewController *)contrl contont:(NSString *)str title:(NSString *)title buttonTitle:(NSString *)buttonTitle;

+ (NSMutableAttributedString *)setNSStringColor:(NSString *)str withColor:(UIColor *)colco andRange:(NSRange)range;

+ (NSMutableAttributedString *)setDoubleNSStringColor:(NSString *)str withColor:(UIColor *)colco andRange:(NSRange)range andRange:(NSRange)range2;

+ (NSMutableAttributedString *)setNSStringLine:(NSString *)textStr rang:(NSRange)rang;

+ (UIButton *)navigationItemBtn:(CGRect)frame andTitle:(NSString *)title;

+ (NSDate *)NSDateFormatterTransNSdate:(NSString *)startformatter andEndFormatter:(NSString *)timeStamp;

+ (NSString *)getCurrentDate;

//删除字符串中的下划线
+ (NSString *)deleteline:(NSString *)str;

/**
 设置用*替换手机号码
 */
+ (NSString *)setNumberPhone:(NSString *)str;
@end
