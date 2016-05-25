//
//  FriendDetailFlagCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "FriendDetailFlagCell.h"

@implementation FriendDetailFlagCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCell:(NSString *)str {
    NSString *str0 = @"幸运抢购凭证：0000001";
    NSString *str2 = @"抢购时间：2015-10-20 10：53";
    
    self.authoLabel.attributedText = [MyUnitility setNSStringColor:str0 withColor:[UIColor redColor] andRange:NSMakeRange(7, str0.length-7)];
    
    self.timeLabel.attributedText = [MyUnitility setNSStringColor:str2 withColor:[UIColor colorWithRed:98/255.0f green:180/255.0f blue:213/255.0f alpha:1] andRange:NSMakeRange(5, str2.length-5)];
    
   
}


@end
