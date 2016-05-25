//
//  SiftGoodFlagController.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^sendSiftDataBlock)(NSMutableArray *dataArray);
/*
 筛选商品界面
 */
@interface SiftGoodFlagController : UIViewController

@property (nonatomic,copy)sendSiftDataBlock mySendSiftDataBlock;

@end
