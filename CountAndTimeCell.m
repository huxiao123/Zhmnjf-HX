//
//  CountAndTimeCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "CountAndTimeCell.h"

@implementation CountAndTimeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell{
   self.countLabel.text = @"剩余份数：300/份";
            self.labeledProgressView = [[DALabeledCircularProgressView alloc] initWithFrame:CGRectMake(0, 0, 53, 53)];
//    self.labeledProgressView = [[DALabeledCircularProgressView alloc]initWithFrame:self.CurcieView.frame];
    self.labeledProgressView.roundedCorners = YES;
    self.labeledProgressView.progressLabel.text = [NSString stringWithFormat:@"50%@",@"%"];
    self.labeledProgressView.progress = 0.5f;
    self.labeledProgressView.trackTintColor = [UIColor colorWithRed:222/255.0f green:222/255.0 blue:222/255.0f alpha:1];
    self.labeledProgressView.thicknessRatio = 0.1;
    self.labeledProgressView.progressTintColor = [UIColor redColor];
    [self.CurcieView addSubview:self.labeledProgressView];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
