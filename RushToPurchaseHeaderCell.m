//
//  RushToPurchaseHeaderCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "RushToPurchaseHeaderCell.h"
#import "HRAdView.h"

@implementation RushToPurchaseHeaderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell{
    NSArray *array = @[@"xxxx于5分钟前抢购10份",@"Cage于5分钟前抢购100份",@"Nace于5分钟前抢购1000份",@"Dog于5分钟前抢购10000份"];
    
    HRAdView * view = [[HRAdView alloc]initWithTitles:array];
    view.frame = CGRectMake(-50, 0, ScreeWidth-100,
                            self.ScrollerView.frame.size.height);
    
    view.textAlignment = NSTextAlignmentLeft;//默认
    view.isHaveHeadImg = YES;
    view.isHaveTouchEvent = YES;
    view.labelFont = [UIFont boldSystemFontOfSize:13];
    view.color = [UIColor darkGrayColor];
    view.time = 3.0f;
    [self.ScrollerView addSubview: view];
    view.clickAdBlock = ^(NSUInteger index){


           };

   
    [view beginScroll];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
