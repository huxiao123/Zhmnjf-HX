//
//  GoodsDetailDescCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "GoodsDetailDescCell.h"

@implementation GoodsDetailDescCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell:(GoodsDetailModels *)model{
    switch (model.state.intValue) {
        case 0:
            self.imageView.image = [UIImage imageNamed:@"预售中2@2x"];
            break;
        case 1:
            self.imageView.image = [UIImage imageNamed:@"进行中2@2x"];

            break;
        case 2:
        case 3:
            self.imageView.image = [UIImage imageNamed:@"已满额@2x"];
            
            break;
        case 4:
            self.imageView.image = [UIImage imageNamed:@"未达成@2x"];

            break;
        case 9:
            self.imageView.image = [UIImage imageNamed:@"已达成@2x"];

            break;
        default:
            break;
    }
    
    self.label1.text = model.name;
    self.shareImageView.image = [UIImage imageNamed:@"分享@2x"];
    
    NSString *oldPrice = [NSString stringWithFormat:@"原价：￥%@",model.price];
    NSString *newPrice = [NSString stringWithFormat:@"最低价：￥%@",model.price_new];
    
    self.label2.attributedText = [MyUnitility setNSStringColor:oldPrice withColor:[UIColor redColor] andRange:NSMakeRange(3, oldPrice.length-3)];
    self.label3.attributedText = [MyUnitility setNSStringColor:newPrice withColor:[UIColor redColor] andRange:NSMakeRange(4, newPrice.length-4)];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
