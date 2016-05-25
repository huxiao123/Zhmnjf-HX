//
//  GoodsDetailDescCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsDetailModels.h"
@interface GoodsDetailDescCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UIImageView *descImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shareImageView;

- (void)configCell:(GoodsDetailModels *)model;
@end
