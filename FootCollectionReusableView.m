//
//  FootCollectionReusableView.m
//  UI3_UICollectionViewMuti
//
//  Created by qianfeng on 15/7/16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "FootCollectionReusableView.h"

@implementation FootCollectionReusableView
//重写footcell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, ScreeWidth, 28)];
        _iamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 14, ScreeWidth, 1)];

        [self addSubview:_iamgeView];
        [self addSubview:_titleLabel];
    }
    return self;
}
@end
