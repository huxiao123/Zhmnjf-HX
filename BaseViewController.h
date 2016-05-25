//
//  BaseViewController.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KVNProgress.h>
@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
/*
 [header setImages:idleImages forState:MJRefreshStateIdle];
 // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
 [header setImages:pullingImages forState:MJRefreshStatePulling];
 // 设置正在刷新状态的动画图片
 [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
 */
@property (nonatomic,strong)UITableView *BaseTableView;
@property (nonatomic,strong)NSMutableArray *dataSource;

/*
 配置刷新数据源数组,具体看MJRefresh的demo
 */
//@property (nonatomic,strong)NSMutableArray *idleImages ;
//@property (nonatomic,strong)NSMutableArray *pullingImages;
//@property (nonatomic,strong)NSMutableArray *refreshingImages;

@property (nonatomic,strong)KVNProgressConfiguration *basicConfiguration;//显示进度的图形为基本样式
@end
