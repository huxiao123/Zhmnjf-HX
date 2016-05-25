//
//  ShareListDescCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ShareListDescCell.h"

@implementation ShareListDescCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCell:(NSString *)str andControlFlag:(NSInteger)flag;{
    self.numberLabel.text = [MyUnitility setNumberPhone:self.numberLabel.text];
    if (flag==1) {
       self.numberLabel.text = @"2015-10-10";
        
    }
}
@end
