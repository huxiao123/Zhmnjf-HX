//
//  collection.m
//  collectiontest
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "collection.h"


@implementation collection

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell:(NSString *)cell tagImage:(NSString *)image{
    self.bgImage.image = [UIImage imageNamed:cell];
    self.tagImage.image = [UIImage imageNamed:image];
}


- (void)configCell:(GoodsModel *)model{
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseUrl,[model.pic_list substringFromIndex:1]];
    [self.bgImage sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@""]];
    self.topLabel.text = model.sub_name;
    self.priceLabel.text = [NSString stringWithFormat:@"原价%@ 最终价%@",model.price,model.price_new];
 
    switch (model.state.intValue) {
        case 0:
            self.tagImage.image = [UIImage imageNamed:@"预售中@2x"];
            break;
        case 1:
            self.tagImage.image = [UIImage imageNamed:@"进行中@2x"];
            break;
    
        default:
            break;
    }

}
@end
