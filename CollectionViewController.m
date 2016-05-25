//
//  CollectionView.m
//  collectiontest
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "CollectionViewController.h"
#import "collection.h"
#import "UIImageView+WebCache.h"
#import "SiftGoodFlagController.h"
#import "GoodsDetailViewController.h"
#import "GoodsModel.h"

#define url @"http://www.zhmnjf.com"

@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSArray *_urlArray;
    NSInteger _page;//请求的页数
    
}
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";
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
    _page = 1;
    [self loadData:nil];
    [self initCollectonView];
    [self configNavigationBtn];
    [self configMJRefresh];
    [self initBackTopBtn];
   }

- (NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

//配置刷新控件
- (void)configMJRefresh{
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData:)];
    // 设置普通状态的动画图片
    [header setImages:self.idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:self.pullingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    // 下拉刷新
    _collection.mj_header = header;
    
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadData:)];
    
    // 设置刷新图片
    [footer setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    
    // 设置尾部
    _collection.mj_footer = footer;
    
}

//懒加载
- (NSMutableArray *)idleImages{
    if (_idleImages==nil) {
        NSMutableArray *idleImages = [NSMutableArray array];
        for (NSUInteger i = 1; i<=60; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%ld", i]];
            [idleImages addObject:image];
        }
        _idleImages = idleImages;
    }
    return _idleImages;
}

- (NSMutableArray *)pullingImages{
    if (_pullingImages==nil) {
        NSMutableArray *pullingImages = [NSMutableArray array];
        for (NSUInteger i = 1; i<=3; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%ld", i]];
            [pullingImages addObject:image];
        }
        _pullingImages =pullingImages ;
    }
    return _pullingImages;
}

- (NSMutableArray *)refreshingImages{
    if (_refreshingImages==nil) {
        NSMutableArray *refreshingImages = [NSMutableArray array];
        for (NSUInteger i = 1; i<=3; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%ld", i]];
            [refreshingImages addObject:image];
        }
        _refreshingImages = refreshingImages;
    }
    
    return _refreshingImages;
}

/*
 -30  效果图边距为15
 -20 图片的半径为20
 */
- (void)initBackTopBtn{
    UIButton *backTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backTopBtn.frame = CGRectMake(ScreeWidth-30-20, ScreeHeight-20-30-64, 40, 40);
    [backTopBtn setBackgroundImage:[UIImage imageNamed:@"返回顶部@2x"] forState:UIControlStateNormal];
    [backTopBtn addTarget:self action:@selector(backTopBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backTopBtn];
}

- (void)backTopBtnAction{
    _collection.contentOffset = CGPointMake(0, 0);
}

/*
 waring:接口数据中 page 不能等于0 必须大于等于1 服务器端规定
 */
- (void)loadData:(MJRefreshComponent *)MJRefresh{
    if ([MJRefresh isKindOfClass:[MJRefreshHeader class]]) {
        _page = 1;
        [self.dataSource removeAllObjects];
        
    }else if([MJRefresh isKindOfClass:[MJRefreshAutoFooter class]]){
        _page++;
    }
    
    
    
   [LCCoolHUD showLoadingOblongWithJGHUD:@"加载中..." zoom:YES shadow:YES];
    NSDictionary *param = [NSDictionary dictionary];
    NSString *getUrl = [NSString stringWithFormat:@"http://www.zhmnjf.com/appapi/hdapi.php?page=%ld&pagesize=12",_page];
    [[XHHttpRequest  shareAFHttpRequest] afHttpGetRequest:getUrl WithDic:param WithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSData *data = responseObject;
        NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *dataArray = [resultDict objectForKey:@"data"];
        // NSLog(@"%@",DataParsingError);
        if (dataArray.count==0) {
            [LCCoolHUD hideWithJGHUD];
            [_collection.mj_footer endRefreshing];
            [_collection.mj_header endRefreshing];

        }else{
            for (NSDictionary *dict in dataArray) {
                GoodsModel *model = [[GoodsModel alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                [self.dataSource addObject:model];
            }
            if (self.dataSource!=0) {
                [LCCoolHUD hideWithJGHUD];
                [_collection reloadData];
                [_collection.mj_header endRefreshing];
                [_collection.mj_footer endRefreshing];
                
            }else{
                [_collection.mj_footer endRefreshingWithNoMoreData];
            }

        }
        
    } WithFailure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [LCCoolHUD hideWithJGHUD];
        [_collection.mj_footer endRefreshing];
        [_collection.mj_header endRefreshing];
    }];
    
}

- (void)configNavigationBtn{
    UIButton *btn = [MyUnitility navigationItemBtn:CGRectMake(0, 0, 50, 30) andTitle:@"筛选"];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(siftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)siftBtnAction{
    SiftGoodFlagController *sift = [[SiftGoodFlagController alloc]init];
    sift.title = @"筛选";
    sift.mySendSiftDataBlock = ^(NSMutableArray *dataArray){
        [_dataSource removeAllObjects];
        _dataSource = dataArray;
        [_collection reloadData];
    };
    [self.navigationController pushViewController:sift animated:YES];
}

- (void)initCollectonView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //上下左右距离边界的距离
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    //设置cell的尺寸(一行显示几张)
    layout.itemSize = CGSizeMake((self.view.frame.size.width-30)/2,(self.view.frame.size.width+10)/2);
    //设置横向的最小距离
    layout.minimumInteritemSpacing = 10;
    //设置竖向的最小距离
    layout.minimumLineSpacing = 10;
    
    
    _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreeWidth, ScreeHeight) collectionViewLayout:layout];
    //设置代理
    _collection.delegate = self;
    _collection.dataSource = self;
    _collection.backgroundColor = [UIColor whiteColor];
     _collection.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    //注册cell
    //第一个参数:cell的类型
    //第二个参数:cell的重用标识符
    //    [_collection registerClass:[collection class] forCellWithReuseIdentifier:reuseIdentifier];
    [_collection registerNib:[UINib nibWithNibName:@"collection" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self.view addSubview:_collection];
    
  }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return _dataSource.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    collection *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                 forIndexPath:indexPath];
    [cell configCell:_dataSource[indexPath.row]];
    cell.layer.borderColor = [UIColor colorWithRed:227/255.0f green:228/255.0f blue:229/255.0f alpha:1].CGColor;
    cell.layer.borderWidth = 0.5f;

    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GoodsModel *model = _dataSource[indexPath.row];
    GoodsDetailViewController *control = [[GoodsDetailViewController alloc]init];
    control.goodsId = model.goodsId;
    [self.navigationController pushViewController:control animated:YES];
    
}

@end
