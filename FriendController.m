//
//  FriendController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "FriendController.h"
#import "ShareListDescCell.h"
#import "shareListDetailCell.h"
#import "FriendDetailController.h"

@interface FriendController ()

@end

@implementation FriendController

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
    self.BaseTableView.separatorInset = UIEdgeInsetsZero;
    self.BaseTableView.layoutMargins = UIEdgeInsetsZero;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId1 = @"ShareListDescCellId";
    static NSString *cellId2 = @"shareListDetailCellId";
    if (indexPath.row==0) {
        ShareListDescCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId1];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"ShareListDescCell" owner:self options:nil].lastObject;
        }
        cell.layoutMargins = UIEdgeInsetsZero;
        [cell configCell:@"" andControlFlag:0];
        return cell;
        
    }else{
        shareListDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId2];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"shareListDetailCell" owner:self options:nil].lastObject;
        }
        cell.layoutMargins = UIEdgeInsetsZero;
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendDetailController *control = [[FriendDetailController alloc]init];
    [self.navigationController pushViewController:control animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
