//
//  OrderGoodsCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderGoodsCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottonLabel;
@property (weak, nonatomic) IBOutlet UIImageView *finishImageView;

- (void)configCell:(NSString *)imageUrl andTopLabel:(NSString *)str andMiddleLabel:(NSString *)str2 andBottonLabel:(NSString *)str3;
@end
