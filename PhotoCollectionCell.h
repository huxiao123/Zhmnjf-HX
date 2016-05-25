//
//  PhotoCollectionCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

- (void)configCell:(UIImage *)image;

@end
