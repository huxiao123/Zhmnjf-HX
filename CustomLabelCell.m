//
//  CustomLabelCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "CustomLabelCell.h"

@implementation CustomLabelCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell:(NSArray *)array{
    
    self.nameLabel.text = array[0];
    self.telLabel.text = array[1];
    
    if ([array[3] integerValue]==1) {
        self.seleteImage.hidden = NO;
        self.detailLabel.text = [NSString stringWithFormat:@"[默认]%@",array[2]];
        self.seleteImage.image = [UIImage imageNamed:@"选择按钮@2x"];
        NSLog(@"%@",array[3]);
    }else{
         NSLog(@"%@",array[3]);
        self.seleteImage.hidden = YES;
        self.detailLabel.text = [NSString stringWithFormat:@"%@",array[2]];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
