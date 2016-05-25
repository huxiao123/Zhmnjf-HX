//
//  GetMoneyController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "GetMoneyController.h"
#import "PropertyCountCell.h"
#import "EnterTextFieldCell.h"

@interface GetMoneyController ()
{
    NSMutableArray *_dataArray;
    NSInteger _bankCodeStr;//尾号
    NSString *_bankCodeUserName;//持卡人
    NSString *_bankName;//银行名称
    NSInteger _limitGetMoneyIndex;//提现次数
    NSInteger _Commission;//手续费
    float _TheActualAmountToAccount;//实际到账金额
}
@end

@implementation GetMoneyController

- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initParam];
    [self setArray];
    [self setNavigationItem];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];
}



- (void)initParam{
    self.title = @"提现";
    ShowNavigationBar;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.BaseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _bankName = @"招商银行";
    _limitGetMoneyIndex = 0;
    _bankCodeStr = 5894;
    _bankCodeUserName= @"**哈";
    _Commission = 0;
    _TheActualAmountToAccount = 0.00;
}

- (void)setNavigationItem{
    UIButton *item = [UIButton buttonWithType:UIButtonTypeSystem];
    item.frame = CGRectMake(0, 0, 100, 30);
    [item setTitle:@"充值记录" forState:UIControlStateNormal];
    item.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [item addTarget:self action:@selector(itemAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *ButtonItem = [[UIBarButtonItem alloc]initWithCustomView:item];
    self.navigationItem.rightBarButtonItem = ButtonItem;
}

- (void)setArray{
    if (_dataArray==nil) {
        _dataArray= [NSMutableArray array];
    }
    
    NSArray *sectionArray1 = @[_bankName,[NSString stringWithFormat:BankCodeString,_bankCodeStr]];
    NSArray *sectionArray2 = @[@"持卡人",_bankCodeUserName];
    NSArray *sectionArray4 = @[[NSString stringWithFormat:Commission,_Commission],
                               [NSString stringWithFormat:TheActualAmountToAccount,_TheActualAmountToAccount]];

    [_dataArray addObject:sectionArray1];
    [_dataArray addObject:sectionArray2];
    [_dataArray addObject:sectionArray4];
  

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section<4) {
        return 1;
    }
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 100;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==3) {
        return 30;
        
    }if (section==4) {
        return 150;
    }
    else{
        return 2;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:
        {
            PropertyCountCell *cell = [[NSBundle mainBundle]loadNibNamed:@"PropertyCountCell" owner:self options:nil].lastObject;
            [cell configCell:@"500.00元" content:@"可用余额" isHiddenLabel:YES];
            return cell;
        }
            break;
        case 1:
        case 2:
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = _dataArray[indexPath.section-1][indexPath.row];
            cell.detailTextLabel.text = _dataArray[indexPath.section-1][indexPath.row+1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            if (indexPath.section==1) {
                cell.imageView.image = [UIImage imageNamed:@"提现银行卡logo@2x"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            return cell;
        }
            break;
        case 3:
        {
            EnterTextFieldCell *cell = [[NSBundle mainBundle] loadNibNamed:@"EnterTextFieldCell" owner:self options:nil].lastObject;
            [cell configCell:@"金额" contentPlaceholder:@"请输入大于1元的提现金额"];
            return cell;
        }
            break;
        case 4:
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = _dataArray[indexPath.section-2][indexPath.row];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        default:
            break;
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section==3) {
        return [NSString stringWithFormat:LimitGetMoneyCount,_limitGetMoneyIndex];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==4) {
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, 200)];
        bgView.backgroundColor = [UIColor clearColor];
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(15, 20, ScreeWidth-15*2, 45);
        [sureBtn setTitle:@"提现" forState:UIControlStateNormal];
        [sureBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
        [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(sureBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:sureBtn];
        
        UIButton *explainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        explainBtn.frame = CGRectMake(ScreeWidth/2-50, 20+45+15, 100, 20);
        [explainBtn setTitle:@"提现说明" forState:UIControlStateNormal];
        [explainBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [explainBtn addTarget:self action:@selector(explainBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:explainBtn];
        
        return bgView;
        
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (void)itemAction{
    NSLog(@"充值记录");
}

- (void)sureBtnAction{
    
    NSLog(@"提现");
}

- (void)explainBtnAction{
    NSLog(@"提现说明");
    NSString *contontStr = @"提现是指将第三方平台(乾多多支付)的个人账户资金转到银行卡账户.\n根据第三方支付公司(乾多多支付)的规定,用户提现时乾多多支付公司将收取提现金额的0.25%的手续费。为了回馈用户,账目娘平台目前为用户承担每日第一笔提现费用。\n";
   [MyUnitility configAlertView:self contont:contontStr title:@"提现说明" buttonTitle:@"我知道了"];
    
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
