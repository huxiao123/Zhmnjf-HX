//
//  PhotoCollectionCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "PhotoCollectionCell.h"

@implementation PhotoCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell:(UIImage *)image{
    self.bgImageView.image = image;
}
@end
