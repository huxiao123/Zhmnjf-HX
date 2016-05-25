//
//  HomeViewController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "HomeViewController.h"
#import "CollectionViewController.h"
#import "GoodsModel.h"
#import "RushToPurchaseCell.h"
#import "LimitGoodsCell.h"
#import "PropertyConroller.h"
#import <SDCycleScrollView.h>
#import "RushToPurchaseHeaderCell.h"
#import "MenuView.h"
#import "ImageLabelFlag.h"

#define kScreen_Bounds   [[UIScreen mainScreen] bounds]
#define kScreen_Width    [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height   [[UIScreen mainScreen] bounds].size.height
#define HEADERCONTENVIEW_HEIGHT 265 // 头部视图高度
#define HEADECYCLEVIEW_HEIGHT 165 // banner 高度
//#define NavBar_Height   (IOS7_OR_LATER ? 64 : 44)
#define NavBar_Height   64
// 菜单图片及标题
#define MENUICONS_ARRAY @[@"资产@2x", @"提现@2x", @"绑卡@2x",@"转账@2x",@"充值@2x",@"首页账单@2x",@"邀请有礼@2x",@"首页红包@2x"]

#define MENUTITLES_ARRAY @[@"资产", @"提现", @"绑定银行卡", @"转账", @"充值",@"账单",@"邀请有礼",@"红包"]

@interface HomeViewController ()<SDCycleScrollViewDelegate,iCarouselDataSource, iCarouselDelegate>

@property (nonatomic,strong)NSMutableArray *imageDataSource;
@property (nonatomic,strong)MenuView           *xb_menuView;
@property (nonatomic, strong)SDCycleScrollView *xb_cycleView;
@property (nonatomic, strong)UIView            *xb_headerContenView;
@property (nonatomic, strong)iCarousel         *carousel;
@property (nonatomic, assign) CGSize cardSize;
@property (nonatomic,strong)UIView *iCarouseView;
@end

@implementation HomeViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.BaseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    HiddenVerticalScrollIndicator;
    SetNavigationBarBackgroundImage
    SetNavigationBarTintColor
    [self setupController];
    [self configMJRefresh];
    [self loadData];
}

//配置刷新控件
- (void)configMJRefresh{
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    // 设置普通状态的动画图片
    [header setImages:self.idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:self.pullingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    // 设置header
    self.BaseTableView.mj_header = header;
    
}

- (NSMutableArray *)imageDataSource{
    if (!_imageDataSource) {
        _imageDataSource = [NSMutableArray array];
    }
    return _imageDataSource;
}

- (void)configiCarouse{
    CGFloat cardWidth = [UIScreen mainScreen].bounds.size.width*5.0f/7.0f;
    self.cardSize = CGSizeMake(cardWidth/2, cardWidth/2);
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 15;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return self.cardSize.width;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UIView *cardView = view;
    
    if ( !cardView )
    {
        cardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.cardSize.width, self.cardSize.height)];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:cardView.bounds];
        [cardView addSubview:imageView];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.backgroundColor = [UIColor whiteColor];
        
        cardView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:imageView.frame cornerRadius:5.0f].CGPath;
        cardView.layer.shadowRadius = 3.0f;
        cardView.layer.shadowColor = [UIColor blackColor].CGColor;
        cardView.layer.shadowOpacity = 0.5f;
        cardView.layer.shadowOffset = CGSizeMake(0, 0);
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = imageView.bounds;
        layer.path = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:5.0f].CGPath;
        imageView.layer.mask = layer;
    }
    
    return cardView;
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * self.carousel.itemWidth);
}
- (UIView *)xb_headerContenView
{
    if (!_xb_headerContenView) {
        CGRect aFrame                        = CGRectMake(0, 0, kScreen_Width, HEADERCONTENVIEW_HEIGHT+(HEADERCONTENVIEW_HEIGHT-HEADECYCLEVIEW_HEIGHT)-5);
//                CGRect aFrame                        = CGRectMake(0, 0, kScreen_Width, ScreeWidth);
        _xb_headerContenView                 = [[UIView alloc] initWithFrame:aFrame];
        _xb_headerContenView.backgroundColor = [UIColor whiteColor];
    }
    
    return _xb_headerContenView;
}

- (void)setupController
{
    
    self.BaseTableView.tableHeaderView      = self.xb_headerContenView;
    [self.xb_headerContenView addSubview:self.xb_cycleView];
    [self.xb_headerContenView addSubview:self.xb_menuView];
}

- (SDCycleScrollView *)xb_cycleView
{
    if (!_xb_cycleView) {
        CGRect aFrame                        = CGRectMake(0, 0, kScreen_Width, HEADECYCLEVIEW_HEIGHT);
        _xb_cycleView                        = [[SDCycleScrollView alloc] initWithFrame:aFrame];
        _xb_cycleView.delegate               = self;
        _xb_cycleView.imageURLStringsGroup   = @[@"http://www.zhmnjf.com/public/v1.0/images/b11.jpg",
                                                 @"http://www.zhmnjf.com/public/v1.0/images/b12.jpg",
                                                 @"http://www.zhmnjf.com/public/v1.0/images/b10.jpg"]; // 轮播图片
        _xb_cycleView.pageControlStyle       = SDCycleScrollViewPageContolStyleClassic;// 分页图片样式
        _xb_cycleView.placeholderImage       = [UIImage imageNamed:@"placehodleImg"];// 占位图片
        _xb_cycleView.autoScrollTimeInterval = 5.0;// 滚动间隔时间
    }
    
    return _xb_cycleView;
}

- (MenuView *)xb_menuView
{
    if (!_xb_menuView) {
        CGRect aFrame                        = CGRectMake(0, HEADECYCLEVIEW_HEIGHT, kScreen_Width, (HEADERCONTENVIEW_HEIGHT - HEADECYCLEVIEW_HEIGHT)*2-10);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _xb_menuView = [[MenuView alloc] initWithFrame:aFrame
                                  collectionViewLayout:layout
                                             withIcons:MENUICONS_ARRAY
                                                titles:MENUTITLES_ARRAY];
        _xb_menuView.xb_menuCountOfLine = 4; // 每行容纳菜单个数
        _xb_menuView.xb_menuHeight = HEADERCONTENVIEW_HEIGHT - HEADECYCLEVIEW_HEIGHT; // 每行菜单高度
        
    }
    return _xb_menuView;
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

- (void)loadData{
    
    [LCCoolHUD showLoadingWithJGHUD:@"加载中..." inView:self.view zoom:NO shadow:NO];


    NSDictionary *param = [NSDictionary dictionary];
    
    [[XHHttpRequest  shareAFHttpRequest] afHttpGetRequest:@"http://www.zhmnjf.com/appapi/hdapi.php?page=2&pagesize=3" WithDic:param WithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSData *data = responseObject;
        NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *dataArray = [resultDict objectForKey:@"data"];
        
        for (NSDictionary *dict in dataArray) {
            GoodsModel *model = [[GoodsModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [self.imageDataSource addObject:model];
        }
        if (self.dataSource!=0) {
           [LCCoolHUD hideWithJGHUD];
            [self.BaseTableView.mj_header endRefreshing];
            [self.BaseTableView reloadData];
        }
        
        
    } WithFailure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        self.basicConfiguration.tapBlock = nil;
        [KVNProgress dismiss];
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 55;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row==0 ) {
//        return 44;
//    }
//    if (indexPath.row==1 ) {
//        return 515;
//    }
//    if (indexPath.row==2) {
//        return 55;
//    }
//    if (indexPath.row==3) {
//        return 180;
//    }
//    return 44;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==0){
        RushToPurchaseHeaderCell *cell = [[NSBundle mainBundle]loadNibNamed:@"RushToPurchaseHeaderCell" owner:self options:nil].lastObject;
        cell.backgroundColor = [UIColor clearColor];
        [cell configCell];
        return cell;
    }else
    if (indexPath.row==1) {
        RushToPurchaseCell *cell =  [[NSBundle mainBundle]loadNibNamed:@"RushToPurchaseCell" owner:self options:nil].lastObject;
       [cell configiCarousel];
        return cell;
    }else if(indexPath.row==2){
        ImageLabelFlag *cell = [[NSBundle mainBundle]loadNibNamed:@"ImageLabelFlag" owner:self options:nil].lastObject;
         cell.backgroundColor = [UIColor clearColor];
        return cell;
        
    }else if(indexPath.row==3){

        LimitGoodsCell *cell = [[NSBundle mainBundle]loadNibNamed:@"LimitGoodsCell" owner:self options:nil].lastObject;
        [cell configCell:self.imageDataSource];
        return cell;
    }

    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2) {
        CollectionViewController *control = [[CollectionViewController alloc]init];
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
