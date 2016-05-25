//
//  OrderGoodsCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "OrderGoodsCell.h"

@implementation OrderGoodsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell:(NSString *)imageUrl andTopLabel:(NSString *)str andMiddleLabel:(NSString *)str2 andBottonLabel:(NSString *)str3{
    
    self.topLabel.text = str;
    
    NSString *formatStr = [NSString stringWithFormat:@"购买价：￥%@",str3 ];
    self.middleLabel.text = [NSString stringWithFormat:@"数量：%@",str2 ];
    
   NSMutableAttributedString *attributStr = [MyUnitility setNSStringColor:formatStr withColor:[UIColor redColor] andRange:NSMakeRange(4, formatStr.length-4)];
    
    self.bottonLabel.attributedText = attributStr;

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BaseUrl,[imageUrl substringFromIndex:2]]];
    NSLog(@"%@",url);
    [self.image sd_setImageWithURL:url placeholderImage:OrderImagePlaceHold];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
