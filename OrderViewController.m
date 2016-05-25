//
//  OrderViewController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "OrderViewController.h"
#import "TopBtnCell.h"
#import "OrderGoodsCell.h"
#import "SecodOrderLabelAndButtonCell.h"
#import "OrderModel.h"
#import "NSDate+MyNSDate.h"
#import "StateTableViewCell.h"

//菜单的高度为44
#define leftLine CGRectMake(0, 42, ScreeWidth/2-2,2)
#define rightLine CGRectMake(ScreeWidth/2+2, 42, ScreeWidth/2-2,2)

//订单的三种状态
typedef NS_ENUM (NSInteger,OrderCellType){
    Orderdoing,
    OrderUnFinish,
    OrderFinish
};

static NSString *cellId = @"orderId";
static NSString *OrderGoodsCellId = @"orderGoodsCellId";
static NSString *SecodOrderLabelAndButtonCellId = @"orderLabelAndButtonCellId";

@interface OrderViewController ()
{
    UIImageView *_lineImage;
    OrderCellType _orderCellType;
    NSInteger _page;
    NSTimer *_timer;
    NSArray *_timeArray;
}

@end


@implementation OrderViewController


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if(_timer)
    {
        _timer = nil;//关闭定时器，
    }
}

- (void)viewDidLoad {
  
    [super viewDidLoad];
    self.title = @"订单";
    SetNavigationBarBackgroundImage
    SetNavigationBarTintColor
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.BaseTableView.separatorInset = UIEdgeInsetsZero;
    self.BaseTableView.layoutMargins = UIEdgeInsetsZero;
    _page = 1;
    [self configTopMenuView];
    [self loadData:nil];
    [self configMJRefresh];
    [self configNSTime];
}

- (void)configNSTime{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(calTime) userInfo:nil repeats:YES];
    }

}
//定时器刷新倒计时
-(void)calTime
{
    
    NSArray  *cells = self.BaseTableView.visibleCells; //取出屏幕可见cell
    for (UITableViewCell *cell in cells) {
        if ([cell isKindOfClass:[SecodOrderLabelAndButtonCell class]]) {
            //强制类型转换
            SecodOrderLabelAndButtonCell *labelCell = (SecodOrderLabelAndButtonCell *)cell;
            
            NSDate *date = [[NSDate alloc]init];
            OrderModel *model = self.subDataSource[cell.tag];
            
            if ([model.state isEqualToString:@"2"]||
                [model.state isEqualToString:@"3"]||
                [model.state isEqualToString:@"4"]) {
                [labelCell config:@"活动结束" btnImage:nil isHiddenBtn:YES];
              
            }else if ([model.state isEqualToString:@"9"]) {
                [labelCell config:@"活动结束" btnImage:@"查看物流可点击@2x" isHiddenBtn:NO];
                
            }else{
                date = [self isOrderModelSate:model andNSDate:date];
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                NSString *fireStr = [formatter stringFromDate:date];
                NSString *activeTime = [date getTimeStr:fireStr andSate:model.state];//@"2016-04-13 16:00:24"
                
                [labelCell config:activeTime btnImage:nil isHiddenBtn:YES];
                
            }
            
       }

    }
}

//判断是预售还是进行中
- (NSDate *)isOrderModelSate:(OrderModel *)model andNSDate:(NSDate *)date{
    NSDate *dates = [[NSDate alloc]init];
    /*
     @param:1进行中。。。。 0预售中。。。。
     */
    if ([model.state isEqualToString:@"1"]) {
         //格式化时间戳
        dates = [date dateFormatTranstDate:model.endtime];
        
    }else if([model.state isEqualToString:@"0"]){
        dates = [date dateFormatTranstDate:model.starttime];
        
    }
    return dates;
}

//判断活动是否结束
- (void)isActivyTimeOvery{
    
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
    // 设置header
    self.BaseTableView.mj_header = header;
    
    
    
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadData:)];
    
    // 设置刷新图片
    [footer setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    
    // 设置尾部
    self.BaseTableView.mj_footer = footer;

    
}

- (NSMutableArray *)subDataSource{
    if (_subDataSource==nil) {
        _subDataSource = [NSMutableArray array];
    }
    return _subDataSource;
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

//初始化顶部菜单按钮
- (void)configTopMenuView{
    UIView *menuView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth,44)];
    menuView.backgroundColor = [UIColor whiteColor];
    
    CGSize viewSize = menuView.frame.size;
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftBtn.frame = CGRectMake(0, 0,viewSize.width/2-1 , 44);
    leftBtn.tag = 1;
    [leftBtn setTintColor:[UIColor redColor]];
    [leftBtn addTarget:self action:@selector(menuBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitle:@"消费产品" forState:UIControlStateNormal];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rightBtn.frame = CGRectMake(viewSize.width/2+1, 0,viewSize.width/2-1 , 44);
    rightBtn.tag = 2;
    [rightBtn setTintColor:[UIColor grayColor]];
    [rightBtn addTarget:self action:@selector(menuBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:@"金融产品" forState:UIControlStateNormal];
    
    /*
     label  距离顶部和底部都是8cm
     */
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(ScreeWidth/2-0.5, 8, 1, 28)];
    label.layer.borderWidth = 2;
    label.backgroundColor  = [UIColor grayColor];
    label.alpha = 0.2;
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 42, ScreeWidth,1)];
    label2.backgroundColor  = [UIColor grayColor];
    label2.alpha = 0.4;
    
    _lineImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"滑动选择条@2x"]];
    _lineImage.frame = leftLine;
    [menuView addSubview:label];
    [menuView addSubview:leftBtn];
    [menuView addSubview:rightBtn];
    [menuView addSubview:label2];
    [menuView addSubview:_lineImage];
    [self.view addSubview:menuView];
    
}

- (void)loadData:(MJRefreshComponent *)MJRefresh{
    if ([MJRefresh isKindOfClass:[MJRefreshHeader class]]) {
        _page = 1;
        [self.subDataSource removeAllObjects];
        
    }else if([MJRefresh isKindOfClass:[MJRefreshAutoFooter class]]){
        _page++;
    }

    [LCCoolHUD showLoadingWithJGHUD:@"加载中..." inView:self.view zoom:NO shadow:NO];

    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"page",@"6",@"pagesize", nil];
    NSString *urlStr = [NSString stringWithFormat:@"http://www.zhmnjf.com/appapi/hdddapi.php?id=7&page=%ld",_page];
    
    [[XHHttpRequest shareAFHttpRequest]afHttpGetRequest:urlStr WithDic:param WithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error;
        NSData *data = responseObject;
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSArray *dataElement = [result objectForKey:@"data"];
            
            //data数据为空
            if (dataElement.count==0) {
                [self configNullDataUI];
                [self.BaseTableView.mj_footer endRefreshingWithNoMoreData];

            }else{//data数据不为空

                for (NSDictionary *dict in dataElement) {
                    OrderModel *model = [[OrderModel alloc]init];
                    [model setValuesForKeysWithDictionary:dict];
                    [self.subDataSource addObject:model];
                }
                if (self.subDataSource.count!=0) {
                    [LCCoolHUD hideWithJGHUD];
                    [self.BaseTableView.mj_header endRefreshing];
                    [self.BaseTableView.mj_footer endRefreshing];
                    [self.BaseTableView reloadData];

                }
            }
            
        }else{
            NSLog(@"%@",DataParsingError);
            [LCCoolHUD hideWithJGHUD];
        }
        
        
        
    } WithFailure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
         [LCCoolHUD hideWithJGHUD];
        [self.BaseTableView.mj_header endRefreshing];
        [self.BaseTableView.mj_footer endRefreshing];
    }];

}

//没有数据时，加载的UI
- (void)configNullDataUI
{
    UIImageView *NullImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreeWidth/2-50, (ScreeHeight-64)/2-76/2, 100, 76)];
    NullImageView.tag = 3;
    NullImageView.image = [UIImage imageNamed:@"暂无订单-2@2x"];
    [self.view addSubview:NullImageView];
}

- (void)menuBtnAction:(UIButton *)btn{
    
    UIImageView *NullImageView = (UIImageView *)[self.view viewWithTag:3];
     [NullImageView removeFromSuperview];
    
    if (btn.tag==1) {
        [btn setTintColor:[UIColor redColor]];
        UIButton *rightBtn = (UIButton *)[self.view viewWithTag:2];
        [rightBtn setTintColor:[UIColor grayColor]];
        _lineImage.frame = leftLine;
        [self.view addSubview:self.BaseTableView];
        [self configTopMenuView];
        
    }else{
        [btn setTintColor:[UIColor redColor]];
        UIButton *rightBtn = (UIButton *)[self.view viewWithTag:1];
        [rightBtn setTintColor:[UIColor grayColor]];
        _lineImage.frame = rightLine;
        [self.BaseTableView removeFromSuperview];
        [self configNullDataUI];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.subDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 50;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderModel *model = self.subDataSource[indexPath.section];
    if (indexPath.row==0) {
        StateTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (!cell) {
           cell = [[NSBundle mainBundle]loadNibNamed:@"StateTableViewCell" owner:self options:nil].lastObject;
        }
        cell.layoutMargins = UIEdgeInsetsZero;
        if ([model.state isEqual:@"1"]) {
            cell.titleLabel.text = [NSString stringWithFormat:currentPrice,model.price_new];
            cell.stateLabel.attributedText = [MyUnitility setNSStringColor:@"进行中" withColor:[UIColor redColor] andRange:NSMakeRange(0, 3)];;
            cell.stateLabel.font = [UIFont systemFontOfSize:12];
            cell.finishImageView.hidden = YES;
            
            }else if ([model.state isEqual:@"9"]){
                
            cell.titleLabel.text = [NSString stringWithFormat:activFinish,model.price_new];
            cell.stateLabel.attributedText = [MyUnitility setNSStringColor:finish withColor:[UIColor redColor] andRange:NSMakeRange(0, 2)];
            cell.finishImageView.hidden = NO;


        }else{
            cell.titleLabel.text = [NSString stringWithFormat:activUnFinish];
            cell.stateLabel.text = over;
            cell.finishImageView.hidden = YES;

        }

        return cell;
    }
    if (indexPath.row==1) {
        OrderGoodsCell  *cell = [tableView dequeueReusableCellWithIdentifier:OrderGoodsCellId];
        
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"OrderGoodsCell" owner:self options:nil].lastObject;
        }
        cell.layoutMargins = UIEdgeInsetsZero;
        if ([model.state isEqual:@"1"]) {
            cell.finishImageView.hidden = YES;
            
        }else if ([model.state isEqual:@"9"]){
            cell.finishImageView.hidden = NO;
            
        }else{
             cell.finishImageView.hidden = YES;
        }

        [cell configCell:model.pic_info andTopLabel:model.name andMiddleLabel:model.buycount andBottonLabel:model.price];
        return cell;
    }
    if (indexPath.row==2) {
        SecodOrderLabelAndButtonCell  *cell = [tableView dequeueReusableCellWithIdentifier:SecodOrderLabelAndButtonCellId];
        if (!cell) {
             cell = [[NSBundle mainBundle]loadNibNamed:@"SecodOrderLabelAndButtonCell" owner:self options:nil].lastObject;
        }
        cell.layoutMargins = UIEdgeInsetsZero;
        cell.tag = indexPath.section;
        return cell;
        
    }
    return nil;
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
