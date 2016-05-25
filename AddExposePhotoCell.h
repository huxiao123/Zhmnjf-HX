//
//  AddExposePhotoCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 添加照片CELL
 */
@interface AddExposePhotoCell : UITableViewCell <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
