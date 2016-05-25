//
//  CommitOrderGoodsDetailCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "CommitOrderGoodsDetailCell.h"
#import "GoodsDetailModels.h"

@implementation CommitOrderGoodsDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)config:(NSMutableArray *)data{
    GoodsDetailModels *model =  data.firstObject;
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseUrl,[model.pic_index substringFromIndex:2]];
    [self.image sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"巴旦木@2x"]];
    
    self.label.text = model.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
