//
//  StandingsViewController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "StandingsViewController.h"
#import "StandingsTopViewCell.h"
#import "SandingsCell.h"

@interface StandingsViewController ()

@end

@implementation StandingsViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.tabBarController.tabBar setHidden:NO];;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"积分";
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
        StandingsTopViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"StandingsTopViewCell" owner:self options:nil].lastObject;
        return cell;
    }
    if (indexPath.section==1) {
        static NSString *cellId = @"cellId";
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.textLabel.text = @"积分记录";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor lightGrayColor];
        return cell;
    }
    if (indexPath.section==2) {
        SandingsCell *cell = [[NSBundle mainBundle]loadNibNamed:@"SandingsCell" owner:self options:nil].lastObject;
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
