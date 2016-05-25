//
//  CollectionView.h
//  collectiontest
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 全部商品界面
 */
@interface CollectionViewController : UIViewController

@property (nonatomic,strong)NSMutableArray *idleImages ;
@property (nonatomic,strong)NSMutableArray *pullingImages;
@property (nonatomic,strong)NSMutableArray *refreshingImages;
@property (nonatomic,strong)UICollectionView *collection;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end
