//
//  RushToPurchaseCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
//抢购专区
@interface RushToPurchaseCell : UITableViewCell<iCarouselDataSource, iCarouselDelegate>

- (IBAction)AllPulishBtnAction:(id)sender;
- (IBAction)AllZeroBuyBtnAction:(id)sender;
- (iCarousel *)configiCarousel;



@property (weak, nonatomic) IBOutlet UIView *ICarousel;
@property (weak, nonatomic) IBOutlet UIImageView *iphoneBgView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/**
 晒单分享背景view
 */
@property (weak, nonatomic) IBOutlet UIImageView *shaiDanShare;
/**
 晒单分享标题
 */
@property (weak, nonatomic) IBOutlet UILabel *shareTitleLabel;
/**
 晒单分享子标题
 */
@property (weak, nonatomic) IBOutlet UILabel *shareSubTitleLabel;
/**
 晒单分享图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *shareImageView;
@property (weak, nonatomic) IBOutlet UILabel *iphonePriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightPriceLabel;

/**
 ----------iCarousel--------
 */
@property (nonatomic, strong)iCarousel *carousel;
@property (nonatomic,strong)NSMutableArray *items;
@property (nonatomic, assign)CGSize cardSize;
@property (nonatomic,strong)NSArray *imageArray;

@end
