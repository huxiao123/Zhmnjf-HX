//
//  NowRushViewCtroller.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "NowRushViewCtroller.h"
#import "SecodOrderLabelAndButtonCell.h"
#import "CommitGoodsNumberCellT.h"
#import "ReceiveGoodsDetailCell.h"
#import "CommitOrderGoodsDetailCell.h"
#import "ReceiveAddressController.h"
#import "SaveReceiveAddressDB.h"
#import "ShowReceiveAddressController.h"

@interface NowRushViewCtroller ()
{
    NSInteger _flag;
}
@end

@implementation NowRushViewCtroller
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
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
        return 7;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
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
                return cell;
            }
                break;
            case 2:
            {
                UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.text = @"商品价格";
                cell.detailTextLabel.text = @"￥19";
                return cell;
            }
                
                break;
            case 3:
            {
                CommitGoodsNumberCellT *cell  = [[NSBundle mainBundle]loadNibNamed:@"CommitGoodsNumberCellT" owner:self options:nil].lastObject;
               cell.numberLabel.text = [NSString stringWithFormat:@"剩余%@份",@"1"];
               
                return cell;
            }
                
                break;
            case 4:{
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                NSRange range1 = NSMakeRange(10, 3);
                NSRange range2 = NSMakeRange(15, 3);
                cell.textLabel.textColor = [UIColor lightGrayColor];
                NSMutableAttributedString *attribut = [MyUnitility setDoubleNSStringColor:@"温馨提示：一次性购买10份赠送10元红包" withColor:[UIColor redColor] andRange:range1 andRange:range2];
                
                cell.textLabel.attributedText = attribut;
                
                return cell;
                break;
            }
            case 5:{
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                cell.textLabel.text = @"该商品您可以使用的红包￥10.00";
                [self createSwitch:cell];
                return cell;

                break;
            }
            case 6:
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


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==6) {
        return 44;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
    [takePart setTitle:@"确定" forState:UIControlStateNormal];
    [takePart addTarget:self action:@selector(takePartAction) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:takePart];
    
}

- (void)takePartAction{
}

//效果图上switch的宽度为75 长度为23
- (void)createSwitch:(UITableViewCell *)cell{
    UISwitch *userSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(ScreeWidth-(75/2+15),5, 75/2, cell.contentView.frame.size.height-5)];
    [userSwitch addTarget:self action:@selector(setUserSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:userSwitch];
    if (_flag==1) {
        userSwitch.on = YES;
    }
}

/*
 param:_flag = 1  默认收货地址
 _flag = 0  非默认收货地址
 */
- (void)setUserSwitch:(UISwitch *)switchs{
    if (switchs.on) {
        _flag = 1;
        
    }else{
        _flag = 0;
    }
    NSLog(@"滑动%ld",_flag);
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
