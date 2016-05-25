//
//  GoodsModel.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"-----%@",key);
    if ([key isEqual:@"id"]) {
        self.goodsId = value;
    }
}
/*


 */
@end
