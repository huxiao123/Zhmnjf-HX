//
//  collection.h
//  collectiontest
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"

@interface collection : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIImageView *tagImage;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;


- (void)configCell:(NSString *)cell tagImage:(NSString *)image;
- (void)configCell:(GoodsModel *)model;

@end
