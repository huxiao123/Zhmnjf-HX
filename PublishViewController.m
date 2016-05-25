//
//  PublishViewController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "PublishViewController.h"
#import "PublishViewCellStyleOne.h"
#import "PublishViewCellStyleTwo.h"
#import "PublishDetailViewController.h"
#import "PublishDoingDetailViewController.h"

@interface PublishViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectonView;

@end

@implementation PublishViewController

static NSString * const reuseIdentifierOne = @"PublishCellOne";
static NSString * const reuseIdentifierTwo = @"PublishCellTwo";

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
    [self collectonView];
    self.automaticallyAdjustsScrollViewInsets = YES;
   
}

- (UICollectionView *)collectonView{
    if (!_collectonView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.itemSize = CGSizeMake((self.view.frame.size.width-30)/2,222);
//        layout.estimatedItemSize =CGSizeMake((self.view.frame.size.width-30)/2,222);
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
        [_collectonView registerNib:[UINib nibWithNibName:@"PublishViewCellStyleOne" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifierOne];
        [_collectonView registerNib:[UINib nibWithNibName:@"PublishViewCellStyleTwo" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifierTwo];

        [self.view addSubview:_collectonView];
    }
    return _collectonView;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 39;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item%2==0) {
        PublishViewCellStyleOne *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierOne forIndexPath:indexPath];
        cell.layer.borderColor = [UIColor colorWithRed:227/255.0f green:228/255.0f blue:229/255.0f alpha:1].CGColor;
        cell.layer.borderWidth = 0.5f;
        return cell;

    }else{
        PublishViewCellStyleTwo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierTwo forIndexPath:indexPath];
        cell.layer.borderColor = [UIColor colorWithRed:227/255.0f green:228/255.0f blue:229/255.0f alpha:1].CGColor;
        cell.layer.borderWidth = 0.5f;
        return cell;

    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item%2==0) {
        PublishDetailViewController *control  = [[PublishDetailViewController alloc]init];
        [self.navigationController pushViewController:control animated:YES];

    }else{
        PublishDoingDetailViewController *control = [[PublishDoingDetailViewController alloc]init];
        [self.navigationController pushViewController:control animated:YES];
    }
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
