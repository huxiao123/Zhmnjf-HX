//
//  BaseViewController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
/*
   -----------父类Controller-------
   把一些通用的方法，属性写在这里
 */
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDataArray];
    [self setBaseTableView];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor] ];
   } 

////配置刷新控件
//- (void)configMJRefresh{
//    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
//    // 设置普通状态的动画图片
//    [header setImages:self.idleImages forState:MJRefreshStateIdle];
//    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
//    [header setImages:self.pullingImages forState:MJRefreshStatePulling];
//    // 设置正在刷新状态的动画图片
//    [header setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
//    // 设置header
//    self.BaseTableView.mj_header = header;
//
//}
//
////懒加载
//- (NSMutableArray *)idleImages{
//    if (_idleImages==nil) {
//        NSMutableArray *idleImages = [NSMutableArray array];
//        for (NSUInteger i = 1; i<=60; i++) {
//            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%ld", i]];
//            [idleImages addObject:image];
//        }
//        _idleImages = idleImages;
//    }
//    return _idleImages;
//}
//
//- (NSMutableArray *)pullingImages{
//    if (_pullingImages==nil) {
//        NSMutableArray *pullingImages = [NSMutableArray array];
//        for (NSUInteger i = 1; i<=3; i++) {
//            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%ld", i]];
//            [pullingImages addObject:image];
//        }
//        _pullingImages =pullingImages ;
//    }
//    return _pullingImages;
//}
//
//- (NSMutableArray *)refreshingImages{
//    if (_refreshingImages==nil) {
//        NSMutableArray *refreshingImages = [NSMutableArray array];
//        for (NSUInteger i = 1; i<=3; i++) {
//            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%ld", i]];
//            [refreshingImages addObject:image];
//        }
//        _refreshingImages = refreshingImages;
//    }
//    
//    return _refreshingImages;
//}
//


//刷新数据源
- (void)loadData{
    printf(__FUNCTION__);
}

- (NSMutableArray *)setDataArray{
    if (self.dataSource==nil) {
        self.dataSource = [NSMutableArray array];
        
    }
    return self.dataSource;
}

- (void)setBaseTableView{
    /*
    在父类中将automaticallyAdjustsScrollViewInsets属性设置为NO  子类中需要的时候 打开YES
     */
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.BaseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.BaseTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, ScreeHeight) style:UITableViewStyleGrouped];
    self.BaseTableView.delegate = self;
    self.BaseTableView.dataSource = self;
    self.BaseTableView.rowHeight = UITableViewAutomaticDimension;
    self.BaseTableView.estimatedRowHeight = 60;
    [self.view addSubview:self.BaseTableView];
    //防止导航栏加了背景图片后，tableview滚动出现问题
    self.BaseTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;

}

#pragma mark ----UITableViewDelegate---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"子类必须实现方法%s",__FUNCTION__);
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"子类必须实现方法%s",__FUNCTION__);
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"子类必须实现方法%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
