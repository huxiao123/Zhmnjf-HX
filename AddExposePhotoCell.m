//
//  AddExposePhotoCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "AddExposePhotoCell.h"
#import "PhotoCollectionCell.h"

static  NSString *photoCollectionCellId = @"photoCollectionCellId";

@implementation AddExposePhotoCell 

- (void)awakeFromNib {
    // Initialization code
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"PhotoCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:photoCollectionCellId];
    }
    
    return self;

}
#pragma mark --------UICollectionDelegate-----------

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionCell *cell = (PhotoCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:photoCollectionCellId forIndexPath:indexPath];
    return cell;
}

//返回cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(94, 120);
}
//返回上下左右的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
@end
