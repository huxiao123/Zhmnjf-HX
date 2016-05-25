//
//  SiftGoodFlagController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "SiftGoodFlagController.h"
#import "FootCollectionReusableView.h"
#import "HeaderUICollectionReusableView.h"
#import "GoodsModel.h"

static NSString *ReuseIdentifier = @"ReuseIdentifierId";
#define kHeaderReuseID @"headerID"
#define kFooterReuseID @"footerID"

@interface SiftGoodFlagController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_SiftCollectonView;
    UICollectionViewFlowLayout *_SiftCollectionFlowLayout;
    NSMutableArray *_dataSource;
    NSMutableArray *_siftDataSoucre;//筛选结构数据源
    UIView *_alphaView;
    NSInteger _seleIndex;//活动状态
    NSInteger _seleteCellIndex;//选中商品类型
}
@end

@implementation SiftGoodFlagController

- (void)viewWillAppear:(BOOL)animated{
    ShowNavigationBar;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSource];
    [self initSiftCollectonView];
    [self configNavigationBtn];
    

}

- (void)configNavigationBtn{
    UIButton *btn = [MyUnitility navigationItemBtn:CGRectMake(0, 0, 50, 30) andTitle:@"确定"];
    [btn addTarget:self action:@selector(sureBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)initSiftCollectonView{
    _SiftCollectionFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    //上下左右距离边界的距离
    _SiftCollectionFlowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    //设置cell的尺寸(一行显示几张)
    _SiftCollectionFlowLayout.itemSize = CGSizeMake((self.view.frame.size.width-80)/3,(ScreeHeight-80-35-130-64)/3);
    NSLog(@"%lf",ScreeHeight);
    //设置横向的最小距离
    _SiftCollectionFlowLayout.minimumInteritemSpacing = 20;
    //设置竖向的最小距离
    _SiftCollectionFlowLayout.minimumLineSpacing = 20;

    
    if (!_SiftCollectonView) {
        _SiftCollectonView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, ScreeHeight) collectionViewLayout:_SiftCollectionFlowLayout];
        //设置代理
        _SiftCollectonView.delegate = self;
        _SiftCollectonView.dataSource = self;
        _SiftCollectonView.backgroundColor = [UIColor whiteColor];
        
        //注册cell
        //第一个参数:cell的类型
        //第二个参数:cell的重用标识符
        //    [_collection registerClass:[collection class] forCellWithReuseIdentifier:reuseIdentifier];
        [_SiftCollectonView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ReuseIdentifier];
        [self.view addSubview:_SiftCollectonView];
    }
    
    //注册headerView的view需要继承UICollectionReusableView
    [_SiftCollectonView registerClass:[HeaderUICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderReuseID];
    [_SiftCollectonView registerClass:[FootCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kFooterReuseID];//SupplementaryView额外的视图

}

- (void)initDataSource{
    _seleIndex = 1;
    _seleteCellIndex = 1;
    _dataSource = [NSMutableArray arrayWithObjects:@"传承",@"配饰",@"居家",@"生鲜",@"食品",@"文体",@"科技", nil];
}

#pragma mark ----Delegate---
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 7;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];

    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
    NSLog(@"%@",_dataSource[indexPath.row]);
    image.image = [UIImage imageNamed:_dataSource[indexPath.row]];
    [cell.contentView addSubview:image];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    if (!_alphaView) {
        _alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
        _alphaView.backgroundColor = [UIColor grayColor];
        _alphaView.alpha = 0.3;
    }
    
    [cell.contentView addSubview:_alphaView];
    _seleteCellIndex = indexPath.row+1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(ScreeWidth, 35);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return  CGSizeMake(ScreeWidth, 130);
}



//判断是headerview还是footerview
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //获取headerview
    if(kind==UICollectionElementKindSectionHeader){
        HeaderUICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeaderReuseID forIndexPath:indexPath];
        headerView.titleLabel.text = @"商品类型";
        headerView.titleLabel.textAlignment = NSTextAlignmentCenter;
        headerView.imageView.image = [UIImage imageNamed:@"横分割线-拷贝"];
        headerView.backgroundColor = [UIColor whiteColor];
        return headerView;
        //footerview
    }else if (kind==UICollectionElementKindSectionFooter){
        FootCollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kFooterReuseID forIndexPath:indexPath];
        footView.titleLabel.text = @"活动状态";
        footView.titleLabel.textAlignment = NSTextAlignmentCenter;
        footView.iamgeView.image = [UIImage imageNamed:@"横分割线-拷贝"];
        footView.backgroundColor = [UIColor whiteColor];
        
        NSArray *title = @[@"进行中",@"预售中"];
        UIButton *doingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        doingBtn.frame =  CGRectMake(15, 15+28+10, (ScreeWidth/2)-15, 30);
        [doingBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [doingBtn setTitle:title.firstObject forState:UIControlStateNormal];
        [doingBtn addTarget:self action:@selector(siftGoddsAction:) forControlEvents:UIControlEventTouchUpInside];
        doingBtn.tag = 100;
        [doingBtn setBackgroundImage:[UIImage imageNamed:@"进行中sift@2x"] forState:UIControlStateNormal];
        
        UIButton *pre_sell_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        pre_sell_Btn.frame =  CGRectMake(15+(ScreeWidth/2)-15, 15+28+10, (ScreeWidth/2)-15, 30);
        [pre_sell_Btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [pre_sell_Btn setTitle:title.lastObject forState:UIControlStateNormal];
        [pre_sell_Btn addTarget:self action:@selector(siftGoddsAction:) forControlEvents:UIControlEventTouchUpInside];
        pre_sell_Btn.tag = 101;
        [pre_sell_Btn setBackgroundImage:[UIImage imageNamed:@"预售中sift@2x"] forState:UIControlStateNormal];

        [footView addSubview:pre_sell_Btn];
        [footView addSubview:doingBtn];
        return footView;
    }
    return nil;
}

- (void)siftGoddsAction:(UIButton *)btn{
    
    if (btn.tag==100) {
        _seleIndex = 1;
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        UIButton *doingBtn = (UIButton *)[self.view viewWithTag:101];
        [doingBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }else{
        _seleIndex = 2;
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        UIButton *pre_sell_Btn = (UIButton *)[self.view viewWithTag:100];
        [pre_sell_Btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    }
}

- (void)sureBtnAction{
    [self loadSiftDataSource];
}

- (void)loadSiftDataSource{
    _siftDataSoucre = [NSMutableArray array];
    NSDictionary *param = [NSDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"http://www.zhmnjf.com/appapi/hdsxapi.php?cat=%ld&State=%ld",_seleteCellIndex,_seleIndex];
    
    [[XHHttpRequest shareAFHttpRequest]afHttpGetRequest:url WithDic:param WithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSData *data = responseObject;
        NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *dataArray = [resultDict objectForKey:@"data"];
        
        for (NSDictionary *dict in dataArray) {
            GoodsModel *model = [[GoodsModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_siftDataSoucre addObject:model];
        }
        
        if (self.mySendSiftDataBlock) {
            self.mySendSiftDataBlock(_siftDataSoucre);
            [self.navigationController popViewControllerAnimated:YES];
        }

    } WithFailure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
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
