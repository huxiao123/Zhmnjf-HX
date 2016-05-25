//
//  OrderModel.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"-----%@",key);
    if ([key isEqual:@"id"]) {
        self.userid = value;
    }
}
@end
