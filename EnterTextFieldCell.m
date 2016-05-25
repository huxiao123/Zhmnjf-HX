//
//  EnterTextFieldCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "EnterTextFieldCell.h"

@implementation EnterTextFieldCell

- (void)awakeFromNib {
    // Initialization code
}



- (void)configCell:(NSString *)title contentPlaceholder:(NSString *)content{
    self.titleLabel.text = title;
    self.EnterTextField.placeholder = content;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
