//
//  GoodsDetailViewController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "GoodsDetailViewController.h"
#import "GoodTopViewCell.h"
#import "GoodsDetailDescCell.h"
#import "GoodsDetailModels.h"
#import "CommitOrderController.h"

@interface GoodsDetailViewController ()

@end

@implementation GoodsDetailViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadDataSource];
  
}

- (void)loadDataSource{
    self.dataSource = [NSMutableArray array];
    NSDictionary *param = [NSDictionary dictionary];
    NSString *url = [NSString stringWithFormat:@"http://www.zhmnjf.com/appapi/hdcyapi.php?id=%@",self.goodsId];
    
    [[XHHttpRequest shareAFHttpRequest]afHttpGetRequest:url WithDic:param WithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error;
        NSData *data = responseObject;
        NSDictionary *dictResult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        if ([dictResult isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dataDict = [dictResult objectForKey:@"data"];
            GoodsDetailModels *model = [[GoodsDetailModels alloc]init];
            [model setValuesForKeysWithDictionary:dataDict];
            [self.dataSource addObject:model];
        }else{
            NSLog(@"不是字典");
        }
       
        [self.BaseTableView reloadData];
    } WithFailure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataSource.count==0) {
        return 0;
    }
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 165;
        }
        if (indexPath.row==1) {
            return 100;
        }else{
            return 44;
        }
    }else if (indexPath.section==1
             ){
        if (indexPath.row==0) {
            return 88;
        }else{
            return 44;
        }
        
    }
    else{
        return 48;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
        switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row==0) {
                GoodTopViewCell *cell = [[NSBundle mainBundle] loadNibNamed:@"GoodTopViewCell" owner:self options:nil].lastObject;
                [cell configCellImage:self.dataSource];
                return cell;
            }
            if (indexPath.row==1) {
                GoodsDetailDescCell *cell = [[NSBundle mainBundle] loadNibNamed:@"GoodsDetailDescCell" owner:self options:nil].lastObject;
                [cell configCell:self.dataSource.firstObject];
                return cell;
            }
            if (indexPath.row==2) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.text = @"剩余时间：";
                cell.textLabel.font = [UIFont systemFontOfSize:14];
                return cell;
            }
        }
            break;
        case 1:{
            if (indexPath.row==0) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
                cell.textLabel.text = @"活动说明";
                cell.detailTextLabel.text = @"活动时间结束\n1.如果达到成团条件会立即返还原价与当前价差价的金额\n2.如果未达到成团条件会立即返还购买金额";
                cell.detailTextLabel.numberOfLines = 0;
                cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                return cell;

            }
            if (indexPath.row==1) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                cell.textLabel.text = @"成团条件：出售份额大于等于1份";
                cell.textLabel.font = [UIFont systemFontOfSize:14];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;

            }
                       break;
        }
        case 2:{
            if (indexPath.row==0) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                cell.textLabel.text = @"活动规则";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
            if (indexPath.row==1) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.text = @"商品详情";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;

            }
        }
        case 3:{
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"当前已出售6份";
            [self createTakePart:cell];
            return cell;

        }
        default:
            break;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

}

//最后一行的cell高度为48
- (void)createTakePart:(UITableViewCell *)cell{
    UIButton *takePart = [UIButton buttonWithType:UIButtonTypeCustom];
    takePart.frame = CGRectMake(ScreeWidth-113, 0, 113,48);
    [takePart setBackgroundImage:[UIImage imageNamed:@"立即参与红@2x"] forState:UIControlStateNormal];
    [takePart addTarget:self action:@selector(takePartAction) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:takePart];
    
     GoodsDetailModels *model = self.dataSource.firstObject;
    if (model.state.intValue!=1) {
        takePart.enabled = NO;//立即参与灰@2x
        [takePart setBackgroundImage:[UIImage imageNamed:@"立即参与灰@2x"] forState:UIControlStateNormal];

    }else{
        [takePart setBackgroundImage:[UIImage imageNamed:@"立即参与红@2x"] forState:UIControlStateNormal];
        takePart.enabled = YES;
    }

}

- (void)takePartAction{
    CommitOrderController *control = [[CommitOrderController alloc]init];
    control.title = @"订单";
    control.dataArray = self.dataSource;
    [self.navigationController pushViewController:control animated:YES];
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
