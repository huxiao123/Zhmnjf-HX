//
//  HeaderUICollectionView.m
//  UI3_UICollectionViewMuti
//
//  Created by qianfeng on 15/7/16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HeaderUICollectionReusableView.h"

@implementation HeaderUICollectionReusableView

//重写headercell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreeWidth, 35)];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 34, ScreeWidth, 1)];
        [self addSubview:_imageView];
        [self addSubview:_titleLabel];
    }
    return self;
}
@end
