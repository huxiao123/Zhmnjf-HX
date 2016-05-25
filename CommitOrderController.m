//
//  CommitOrderController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "CommitOrderController.h"
#import "CommitOrderGoodsDetailCell.h"
#import "SecodOrderLabelAndButtonCell.h"
#import "CommitGoodsNumberCellT.h"
#import "ReceiveGoodsDetailCell.h"
#import "CommitOrderGoodsDetailCell.h"
#import "ReceiveAddressController.h"
#import "SaveReceiveAddressDB.h"
#import "ShowReceiveAddressController.h"

@interface CommitOrderController ()<WarringMessageDelegate>

@end

@implementation CommitOrderController
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    HiddenNavigationBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ShowNavigationBar;
    self.BaseTableView.backgroundColor = [UIColor whiteColor];
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 5;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==1) {
            return 85;
        }if (indexPath.row==4) {
            return 133;

        }
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
            {
                SecodOrderLabelAndButtonCell *cell = [[NSBundle mainBundle]loadNibNamed:@"SecodOrderLabelAndButtonCell" owner:self options:nil].lastObject;
                [cell config:@"可用余额￥19" btnImage:@"充值按钮@2x" isHiddenBtn:NO];
                return cell;

            }
                break;
            case 1:
            {
                CommitOrderGoodsDetailCell *cell = [[NSBundle mainBundle]loadNibNamed:@"CommitOrderGoodsDetailCell" owner:self options:nil].lastObject;
                [cell config:self.dataArray];
                return cell;
            }
                break;
            case 2:
            {
                UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.text = @"商品价格";
                GoodsDetailModels *model = self.dataArray.firstObject;
                NSAttributedString *attribute = [MyUnitility setNSStringColor:[NSString stringWithFormat:@"￥%@",model.price_new] withColor:[UIColor redColor] andRange:NSMakeRange(0, model.price_new.length+1)];
                cell.detailTextLabel.attributedText = attribute;
                return cell;
            }

                break;
            case 3:
            {
                CommitGoodsNumberCellT *cell  = [[NSBundle mainBundle]loadNibNamed:@"CommitGoodsNumberCellT" owner:self options:nil].lastObject;
                GoodsDetailModels *model = self.dataArray.firstObject;
                cell.messageDelegate = self;
                cell.numberLabel.text = [NSString stringWithFormat:@"剩余%@份",model.sum];
                cell.dataArray = self.dataArray;
                return cell;
            }
  
                break;
            case 4:
            {
                ReceiveGoodsDetailCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ReceiveGoodsDetailCell" owner:self options:nil].lastObject;
                NSArray *addressArray = [self getDefaultReceiveAddress];
                [cell configCell:addressArray];
                return cell;
            }
 
                break;
            default:
                break;
        }
            }else{
                UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.text = @"合计:￥19元";
                [self createTakePart:cell];
                return cell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 44;
    }
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
 
    if (section==0) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, 44)];
        view.backgroundColor = [UIColor whiteColor];
        return view;
    }
    return nil;
}

/*
 param:dataArray  数据库返回的数据
 如果dataArray.count==0说明么有添加地址
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==4) {
        //判断有无收获地址
      NSArray *dataArray =  [[SaveReceiveAddressDB shareManager]selectAllData];
        
        if (dataArray.count == 0) {
            
            ReceiveAddressController *control = [[ReceiveAddressController alloc]init];
            control.title = @"编辑收获地址";
            [self.navigationController pushViewController:control animated:YES];
            
        }else{
            ShowReceiveAddressController *control =[[ShowReceiveAddressController alloc]init];
            control.title = @"收获地址";
            [self.navigationController pushViewController:control animated:YES];
        }
        
       

    }
}

- (NSArray *)getDefaultReceiveAddress{
    NSArray *addressArray = [[SaveReceiveAddressDB shareManager] selectAllData];
    
    for (NSArray *subArray in addressArray) {
        for (NSInteger i=0; i<subArray.count; i++) {
            if ([subArray[3] isEqualToString:@"1"]) {
    
                return subArray;
            }
        }
    }
    return nil;
}

- (void)createTakePart:(UITableViewCell *)cell{
    UIButton *takePart = [UIButton buttonWithType:UIButtonTypeCustom];
    takePart.frame = CGRectMake(ScreeWidth-113, 0, 113,44);
    [takePart setBackgroundImage:[UIImage imageNamed:@"结算背景@2x"] forState:UIControlStateNormal];
    [takePart setTitle:@"结算" forState:UIControlStateNormal];
    [takePart addTarget:self action:@selector(takePartAction) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:takePart];
    
}

- (void)takePartAction{
   }

- (void)sendWarringMessage:(NSString *)message{

      [LCCoolHUD showFailure:message zoom:YES shadow:YES];
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
