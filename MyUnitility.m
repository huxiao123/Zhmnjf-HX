//
//  MyUnitility.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "MyUnitility.h"
@implementation MyUnitility


+ (UIView *)configAlertView:(UIViewController *)contrl contont:(NSString *)str title:(NSString *)title buttonTitle:(NSString *)buttonTitle{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:str delegate:contrl cancelButtonTitle:buttonTitle otherButtonTitles:nil, nil];
    [alert show];
    return alert;
}

+ (UIButton *)navigationItemBtn:(CGRect)frame andTitle:(NSString *)title{
    UIButton *item = [UIButton buttonWithType:UIButtonTypeSystem];
    item.frame = frame;
    [item setTitle:title forState:UIControlStateNormal];
    item.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return item;
}

+ (NSMutableAttributedString *)setNSStringColor:(NSString *)str withColor:(UIColor *)colco andRange:(NSRange)range{
    
    NSMutableAttributedString *attribut = [[NSMutableAttributedString  alloc]initWithString:str];
    [attribut addAttribute:NSForegroundColorAttributeName value:colco range:range];
    return attribut;
}

+ (NSMutableAttributedString *)setDoubleNSStringColor:(NSString *)str withColor:(UIColor *)colco andRange:(NSRange)range andRange:(NSRange)range2{
    
    NSMutableAttributedString *attribut = [[NSMutableAttributedString  alloc]initWithString:str];
    [attribut addAttribute:NSForegroundColorAttributeName value:colco range:range];
    [attribut addAttribute:NSForegroundColorAttributeName value:colco range:range2];
    return attribut;
}

+ (NSMutableAttributedString *)setNSStringLine:(NSString *)textStr rang:(NSRange)rang{
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:textStr];
    [attribute addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:rang];
    return attribute;

}
+ (NSDate *)NSDateFormatterTransNSdate:(NSString *)startformatter andEndFormatter:(NSString *)endTime{
    double time = endTime.boolValue - startformatter.boolValue;
    
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy年MM月DD日";
    NSLog(@"%@",[formatter stringFromDate:date]);
       return nil;
}

+ (NSString *)getCurrentDate{
    
    NSDate *currentDate = [[NSDate alloc]init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    return [formatter stringFromDate:currentDate];
}

+ (NSString *)deleteline:(NSString *)str{
    NSArray *lineArray = [str componentsSeparatedByString:@"-"];
    NSString *backStr = nil;
    if (lineArray.count>1) {
        backStr = [NSString stringWithFormat:@"%@%@",lineArray[0],lineArray[1]];

    }
    return backStr;
}

+ (NSString *)setNumberPhone:(NSString *)str{
    return [str stringByReplacingCharactersInRange:NSMakeRange(3, str.length-3) withString:[NSString stringWithFormat:@"****%@",[str substringWithRange:NSMakeRange(7, str.length-7)]]];
}
@end
