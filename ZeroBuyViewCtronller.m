//
//  ZeroBuyViewCtronller.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ZeroBuyViewCtronller.h"
#import "ZeroBuyCollectionCell.h"
#import "ZeroBuyDetailViewCtroller.h"

@interface ZeroBuyViewCtronller ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectonView;
}
@end

@implementation ZeroBuyViewCtronller

static NSString * const reuseIdentifier = @"ZeroBuyCell";

- (void)viewWillDisappear:(BOOL)animated{
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    ShowNavigationBar;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self configConllectionView];
}

- (void)configConllectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize = CGSizeMake((self.view.frame.size.width-30)/2,218);
//    layout.estimatedItemSize = CGSizeMake((self.view.frame.size.width-30)/2,(self.view.frame.size.width-10)/2);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 10;
    
    
    _collectonView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectonView.backgroundColor = [UIColor whiteColor];
    _collectonView.delegate = self;
    _collectonView.dataSource = self;
    _collectonView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;

    //注册cell
    //第一个参数:cell的类型
    //第二个参数:cell的重用标识符
//        [_collectonView registerClass:[ZeroBuyCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [_collectonView registerNib:[UINib nibWithNibName:@"ZeroBuyCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    [self.view addSubview:_collectonView];

}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 39;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZeroBuyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.layer.borderColor = [UIColor colorWithRed:227/255.0f green:228/255.0f blue:229/255.0f alpha:1].CGColor;
    cell.layer.borderWidth = 0.5f;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZeroBuyDetailViewCtroller *deatail = [[ZeroBuyDetailViewCtroller alloc]init];
    [self.navigationController pushViewController:deatail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
