//
//  RebPackeController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "RebPackeController.h"
#import "TopRedPackge.h"
#import "RedPackgeCell.h"

@interface RebPackeController ()

@end

@implementation RebPackeController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    SetNavigationBarBackgroundImage;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的积分";
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==2) {
        return 6;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        TopRedPackge *cell = [[NSBundle mainBundle]loadNibNamed:@"TopRedPackge" owner:self options:nil].lastObject;
        return cell;
    }
    if (indexPath.section==1) {
        static NSString *cellId = @"cellId";
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.textLabel.text = @"红包记录";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor lightGrayColor];
        return cell;
    }
    if (indexPath.section==2) {
        RedPackgeCell *cell = [[NSBundle mainBundle]loadNibNamed:@"RedPackgeCell" owner:self options:nil].lastObject;
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
