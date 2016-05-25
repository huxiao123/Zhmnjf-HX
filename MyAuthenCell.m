//
//  MyAuthenCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "MyAuthenCell.h"

@implementation MyAuthenCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell{
    NSMutableAttributedString *attribute = [MyUnitility setNSStringLine:self.MyAuthenLabel.text rang:NSMakeRange(0, self.MyAuthenLabel.text.length)];
    self.MyAuthenLabel.attributedText = attribute;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
