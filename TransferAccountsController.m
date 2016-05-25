//
//  TransferAccountsController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "TransferAccountsController.h"
#import "PropertyCountCell.h"
#import "EnterTextFiledImageCell.h"

@interface TransferAccountsController ()

@end

@implementation TransferAccountsController

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
    self.title = @"转账";
    [self setNavigationItem];
}

- (void)setNavigationItem{
    UIButton *item = [UIButton buttonWithType:UIButtonTypeSystem];
    item.frame = CGRectMake(0, 0, 100, 30);
    [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [item setTitle:@"我的联系人" forState:UIControlStateNormal];
    item.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [item addTarget:self action:@selector(itemAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *ButtonItem = [[UIBarButtonItem alloc]initWithCustomView:item];
    [ButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = ButtonItem;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 100;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 10;
    }
    if (section==1) {
        return 30;
    }
    if (section==2) {
        return 150;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section==1) {
        return @"收款人必须开通乾多多支付账号";
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            PropertyCountCell *cell = [[NSBundle mainBundle]loadNibNamed:@"PropertyCountCell" owner:self options:nil].lastObject;
            [cell configCell:@"2000.00元" content:@"可用余额" isHiddenLabel:NO];
            return cell;
        }
            break;
         case 1:
        {
            EnterTextFieldCell *cell = [[NSBundle mainBundle]loadNibNamed:@"EnterTextFieldCell" owner:self options:nil].lastObject;
            [cell configCell:@"收款人" contentPlaceholder:@"收款人手机号、用户号"];
            return cell;
        }
            break;
        case 2:{
            EnterTextFieldCell *cell = [[NSBundle mainBundle]loadNibNamed:@"EnterTextFieldCell" owner:self options:nil].lastObject;
            [cell configCell:@"转账金额" contentPlaceholder:@"请输入转账金额"];
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==2) {
        UIView *bgView  =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, 150)];
        bgView.backgroundColor = [UIColor clearColor];
        
        UIButton *TickoffBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        TickoffBtn.selected = NO;
        TickoffBtn.frame = CGRectMake(15, 10, 17, 17);
        [TickoffBtn setBackgroundImage:[UIImage imageNamed:@"勾选框@2x"] forState:UIControlStateNormal];
        [TickoffBtn addTarget:self action:@selector(TickoffAction:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:TickoffBtn];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15+17+10, 10, ScreeWidth, 17)];
        label.textColor = [UIColor blueColor];
        label.text = @"添加收款人至我的联系人";
        [bgView addSubview:label];
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(15, 55, ScreeWidth-15*2, 45);
        [sureBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [sureBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
        [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(bindCodeAction) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:sureBtn];
        
    
        UIButton *recordTransAccount = [UIButton buttonWithType:UIButtonTypeCustom];
        recordTransAccount.frame = CGRectMake(ScreeWidth/2-50, 55+15+45, 100, 20);
        [recordTransAccount setTitle:@"转账记录" forState:UIControlStateNormal];
        [recordTransAccount setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [recordTransAccount addTarget:self action:@selector(recordTransAccount) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:recordTransAccount];
        
        return bgView;
    }
    return nil;
}

- (void)TickoffAction:(UIButton *)btn{
    if (btn.selected==NO) {
        btn.selected = YES;
        [btn setImage:[UIImage  imageNamed:@"对勾@2x"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage  imageNamed:@"勾选框@2x"] forState:UIControlStateNormal];
        
    }else if (btn.selected==YES){
        btn.selected = NO;
        [btn setImage:[UIImage  imageNamed:@""] forState:UIControlStateNormal];
//         [btn setBackgroundImage:[UIImage  imageNamed:@"勾选框@2x"] forState:UIControlStateNormal];
    }

    NSLog(@"添加联系人");
}

- (void)bindCodeAction{
     NSLog(@"下一步");
}

- (void)recordTransAccount{
    [MyUnitility configAlertView:self contont:@"暂无转账记录" title:@"提示" buttonTitle:@"我知道了"];
    NSLog(@"转账记录");
}

- (void)itemAction{
    NSLog(@"我的联系人");
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
