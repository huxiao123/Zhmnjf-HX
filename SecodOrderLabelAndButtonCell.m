//
//  SecodOrderLabelAndButtonCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "SecodOrderLabelAndButtonCell.h"

@implementation SecodOrderLabelAndButtonCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)config:(NSString *)title btnImage:(NSString *)path isHiddenBtn:(BOOL)isHidden{
    
    self.leftLabel.text = title;
    if (isHidden==YES) {
        self.finishBtn.hidden  = YES;
        
    }else{
        [self.finishBtn setBackgroundImage:[UIImage imageNamed:path] forState:UIControlStateNormal];

    }
   
}

- (IBAction)finishBtn:(id)sender {
}
@end
