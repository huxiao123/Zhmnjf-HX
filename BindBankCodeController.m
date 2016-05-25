//
//  BindBankCodeController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "BindBankCodeController.h"
#import "ShowBankCodeInfoCell.h"
#import "AddBankCodeController.h"
#import "BankCodeInfoController.h"

@interface BindBankCodeController ()

@end

@implementation BindBankCodeController

- (void)viewWillDisappear:(BOOL)animated{
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"银行卡绑定";
    ShowNavigationBar;
    self.BaseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.automaticallyAdjustsScrollViewInsets = YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShowBankCodeInfoCell *cell = [[NSBundle mainBundle] loadNibNamed:@"ShowBankCodeInfoCell" owner:self options:nil].lastObject;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 91, 14)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *addBankCode = [UIButton buttonWithType:UIButtonTypeCustom];
    addBankCode.frame = CGRectMake(10, 10, 91, 14);
    [addBankCode setBackgroundImage:[UIImage imageNamed:@"添加银行卡@2x"] forState:UIControlStateNormal];
    [addBankCode addTarget:self action:@selector(addBankCodeAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:addBankCode];
    
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BankCodeInfoController *control = [[BankCodeInfoController alloc]init];
    control.title = @"银行卡信息";
    [self.navigationController pushViewController:control animated:YES];
}

- (void)addBankCodeAction{
    NSLog(@"addBankCodeAction");
    AddBankCodeController *control = [[AddBankCodeController alloc]init];
    control.title = @"添加银行卡";
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
