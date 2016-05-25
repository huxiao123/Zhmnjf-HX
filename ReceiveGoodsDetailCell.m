//
//  ReceiveGoodsDetailCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ReceiveGoodsDetailCell.h"

@implementation ReceiveGoodsDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell:(NSArray *)array{
    if (array.count>0) {
        self.receivePeople.text = [NSString stringWithFormat:@"收货人:%@",array[0]];
        self.telPhone.text = array[1];
        self.addressLabel.text = array[2];

    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
