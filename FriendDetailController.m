//
//  FriendDetailController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "FriendDetailController.h"
#import "ShareListDescCell.h"
#import "FriendDetailFlagCell.h"
#import "FriendDetailmageCell.h"

static NSString *ReuseIdentifier = @"collectionId";

@interface FriendDetailController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray *imageDataSurce;
@property (nonatomic,strong)UICollectionView *collectionView;
@end

@implementation FriendDetailController
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    ShowNavigationBar;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.BaseTableView.separatorInset = UIEdgeInsetsZero;
    self.BaseTableView.layoutMargins = UIEdgeInsetsZero;
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (NSMutableArray *)imageDataSurce{
    if (!_imageDataSurce) {
        _imageDataSurce = [NSMutableArray arrayWithObjects:@"看我屌不屌系列@2x",@"看我屌不屌系列@2x",@"看我屌不屌系列@2x",@"看我屌不屌系列@2x",@"看我屌不屌系列@2x",nil];
    }
    return _imageDataSurce;
}

#pragma mark ----UIColletionView------
- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((ScreeWidth-30), (ScreeWidth-30));
        layout.minimumInteritemSpacing = 2.5;
        layout.minimumLineSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth-30, (ScreeWidth-30)*self.imageDataSurce.count+10*2+15*self.imageDataSurce.count-1)  collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];

        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ReuseIdentifier];
        
    }
    return _collectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return (ScreeWidth-30)*self.imageDataSurce.count+10*2+15*self.imageDataSurce.count-1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.collectionView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId1 = @"ShareListDescCellId";
    static NSString *cellId2 = @"FriendDetailFlagCellId";
    static NSString *cellId3 = @"FriendDetailmageCellId";
    
    if (indexPath.row==0) {
        ShareListDescCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId1];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"ShareListDescCell" owner:self options:nil].lastObject;
        }
        [cell configCell:@"" andControlFlag:1];
        cell.layoutMargins = UIEdgeInsetsZero;
        return cell;
    }else if (indexPath.row==1)
    {
        FriendDetailFlagCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId2];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"FriendDetailFlagCell" owner:self options:nil].lastObject;
        }
        cell.layoutMargins = UIEdgeInsetsZero;
        [cell configCell:@""];
        return cell;
    }else if(indexPath.row==2){
        FriendDetailmageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId3];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"FriendDetailmageCell" owner:self options:nil].lastObject;
        }
        cell.layoutMargins = UIEdgeInsetsZero;
        return cell;
    }
    return nil;
}

#pragma mark ----UICollectionDelegate----
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageDataSurce.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
    UIImageView *view = [[UIImageView alloc]initWithFrame:cell.bounds];
    view.image = [UIImage imageNamed:self.imageDataSurce[indexPath.item]];
    [cell.contentView addSubview:view];
         return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
