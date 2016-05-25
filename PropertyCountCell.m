//
//  PropertyCountCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "PropertyCountCell.h"

@implementation PropertyCountCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)configCell:(NSString *)title content:(NSString *)content isHiddenLabel:(BOOL)isHidden{
    self.titleLabel.text = title;
    self.descLabel.text = content;
    if (isHidden== YES) {
        self.labelAction.hidden = YES;
        
    }else{
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"充值"];
        NSRange range = {0,[str length]};
        [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
        self.labelAction.attributedText = str;
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
        [self.labelAction addGestureRecognizer:tap];
        
    }
}

- (void)tapGesture{
    NSLog(@"充值");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
