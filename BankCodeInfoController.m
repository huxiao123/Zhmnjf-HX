//
//  BankCodeInfoController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "BankCodeInfoController.h"

@interface BankCodeInfoController ()
{
    NSArray *_titleArray;
    NSMutableArray *_detailArray;
}
@end

@implementation BankCodeInfoController

- (void)viewWillDisappear:(BOOL)animated{
    ShowNavigationBar;
    //    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    ShowNavigationBar;
    [self.tabBarController.tabBar setHidden:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self initArray];
}

- (void)initArray{
    _titleArray = @[@"持卡人",@"开户行",@"卡户地",@"支行名",@"卡号"];
    _detailArray = [NSMutableArray arrayWithObjects:@"hah",@"hha",@"hah",@"fds",@"**** **** **** 7890" ,nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:nil];
    cell.textLabel.text = _titleArray[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.detailTextLabel.text = _detailArray[indexPath.row];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 25, ScreeWidth, 70)];
    bgView.backgroundColor = [UIColor clearColor];
    bgView.userInteractionEnabled = YES;
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(15, 30, ScreeWidth-15*2, 37.5);
    [sureBtn setTitle:@"解除绑定" forState:UIControlStateNormal];
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(bindCodeAction) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:sureBtn];
    return bgView;

}

- (void)bindCodeAction{
    NSLog(@"解除绑定");
    [self.navigationController popViewControllerAnimated:YES];
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
