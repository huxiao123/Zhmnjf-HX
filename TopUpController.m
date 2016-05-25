//
//  TopUpController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "TopUpController.h"
#import "PropertyCountCell.h"

@interface TopUpController ()

@end

@implementation TopUpController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    ShowNavigationBar;
    [self.tabBarController.tabBar setHidden:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self setNavigationItem];
}

- (void)setNavigationItem{
    UIButton *item = [UIButton buttonWithType:UIButtonTypeSystem];
    item.frame = CGRectMake(0, 0, 100, 30);
    [item setTitle:@"充值记录" forState:UIControlStateNormal];
    item.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [item addTarget:self action:@selector(itemAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *ButtonItem = [[UIBarButtonItem alloc]initWithCustomView:item];
    [ButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = ButtonItem;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 100;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==2) {
      return 150;
    }
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            PropertyCountCell *cell = [[NSBundle mainBundle]loadNibNamed:@"PropertyCountCell" owner:self options:nil].lastObject;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell configCell:@"200.00元" content:@"可用余额" isHiddenLabel:YES];
            return cell;
        }
            break;
        case 1:{
            EnterTextFieldCell *cell = [[NSBundle mainBundle]loadNibNamed:@"EnterTextFieldCell" owner:self options:nil].lastObject;
            [cell configCell:@"金额" contentPlaceholder:@"请输入大于1元的充值金额"];
            return cell;
        }
        case 2:{
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = [NSString stringWithFormat:TheActualAmountToAccount,200.00];
            return cell;
        }
        default:
            break;
    }
    return nil;
}


/*
 @param:   15+15+10  15+15为TickoffBtn的左边距+宽度 再+10为效果图上的间距
 */
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==1) {
        UIView *bgView  =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, 150)];
        bgView.backgroundColor = [UIColor clearColor];
        
        UIButton *TickoffBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        TickoffBtn.frame = CGRectMake(15, (30-17)/2, 17, 17);
        [TickoffBtn setBackgroundImage:[UIImage imageNamed:@"勾选框@2x"] forState:UIControlStateNormal];
        [TickoffBtn addTarget:self action:@selector(TickoffAction:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:TickoffBtn];
        
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:@"同意《账目娘居间资金管理服务协议》"];
        NSRange rang = {0,2};
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:rang];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15+17+10, (30-17)/2, ScreeWidth, 15)];
        label.textColor = [UIColor blueColor];
        label.font = [UIFont systemFontOfSize:15];
        label.attributedText = attr;
        [bgView addSubview:label];
        
        return bgView;
    }
    if (section==2) {
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeHeight, 150)];
        bgView.backgroundColor = [UIColor clearColor];
        
        UIButton *topUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        topUpBtn.frame = CGRectMake(15, 55, ScreeWidth-15*2, 45);
        [topUpBtn setTitle:@"充值" forState:UIControlStateNormal];
        [topUpBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
        [topUpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [topUpBtn addTarget:self action:@selector(bindCodeAction) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:topUpBtn];
        
        
        UIButton *explainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        explainBtn.frame = CGRectMake(ScreeWidth/2-50, 55+15+45, 100, 20);
        [explainBtn setTitle:@"充值说明" forState:UIControlStateNormal];
        [explainBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [explainBtn addTarget:self action:@selector(recordTransAccount) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:explainBtn];
        
        return bgView;
    }
    return nil;
}

- (void)bindCodeAction{
    
    NSLog(@"充值");
}

- (void)recordTransAccount{
    NSString *contontStr = @"充值是指将银行卡账户资金转到第三方平台(乾多多支付)的个人账户\n根据第三方支付公司(乾多多支付)的规定,在移动端充值只能走乾多多快捷支付通道,乾多多支付公司将收取充值金额的0.1%的充值费。个人用户在PC(电脑)端充值走乾多多个人网银充值渠道免收充值手续费,建议用户在PC端走个人网银充值渠道充值。\n";
    [MyUnitility configAlertView:self contont:contontStr title:@"充值说明" buttonTitle:@"我知道了"];
    NSLog(@"充值说明");
  
    
}


- (void)TickoffAction:(UIButton *)btn{
    if (btn.selected==NO) {
        btn.selected = YES;
        [btn setImage:[UIImage  imageNamed:@"对勾@2x"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage  imageNamed:@"勾选框@2x"] forState:UIControlStateNormal];
        
    }else if (btn.selected==YES){
        btn.selected = NO;
        [btn setImage:[UIImage  imageNamed:@""] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage  imageNamed:@"勾选框@2x"] forState:UIControlStateNormal];
    }

    NSLog(@"账目娘居间资金管理服务协议");

}

- (void)itemAction{
    NSLog(@"充值记录");
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
