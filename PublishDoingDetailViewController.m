//
//  PublishDoingDetailViewController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "PublishDoingDetailViewController.h"
#import "ZeroBuyDescCell.h"
#import "GoodTopViewCell.h"
#import "LockyUserCell.h"
#import "AuthenNumberCell.h"
#import "MyAuthenCell.h"
#import "CustomSelectList.h"
#import "PublishDoingTimeCell.h"
#include "AlgorithmViewController.h"

@interface PublishDoingDetailViewController ()

@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)UIView *alphView;

@end

@implementation PublishDoingDetailViewController
- (void)viewWillDisappear:(BOOL)animated{
    
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"计算方式",@"商品详情",@"参与记录",@"晒单分享"];
    }
    return _titleArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
            {
                GoodTopViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"GoodTopViewCell" owner:self options:nil].lastObject;
                return cell;
                
            }
                break;
            case 1:{
                ZeroBuyDescCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZeroBuyDescCell" owner:self options:nil].lastObject;
                return cell;
            }
            default:
                break;
        }
    }else{
        switch (indexPath.row) {
            case 0:
            {
                PublishDoingTimeCell *cell = [[NSBundle mainBundle]loadNibNamed:@"PublishDoingTimeCell" owner:self options:nil].lastObject;
                return cell;
              }
                break;
            case 1:
            {
                MyAuthenCell *cell = [[NSBundle mainBundle]loadNibNamed:@"MyAuthenCell" owner:self options:nil].lastObject;
                [cell configCell];
                [self addauthTapGuseter:cell.MyAuthenLabel];
                return cell;
            }
                break;
            case 2:
            case 3:
            case 4:
            case 5:
            {
                static NSString *celId = @"cellId";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celId];
                if (!cell) {
                    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:celId];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.text = self.titleArray[indexPath.row-2];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;
            }
                break;
            default:
                break;
        }
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        if (indexPath.row==2) {
            AlgorithmViewController *control = [[AlgorithmViewController alloc]init];
            [self.navigationController pushViewController:control animated:YES];
        }
    }
}
- (void)addauthTapGuseter:(UILabel *)label{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(authTapGesure)];
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:tapGesture];
}

- (void)authTapGesure{
    CGRect rect = CGRectMake((ScreeWidth-270)/2, (ScreeHeight-281)/2, 270, 281);
    CustomSelectList *list = [[CustomSelectList alloc]initWithFrame:rect];
    
    list.removeCustomViewBlock = ^{
        [self.alphView removeFromSuperview];
    };
    [self.view addSubview:self.alphView];
    [self.view addSubview:list];
    
    
}

- (UIView *)alphView{
    if (!_alphView) {
        _alphView = [[UIView alloc]initWithFrame:self.view.bounds];
        _alphView.backgroundColor = [UIColor blackColor];
        _alphView.alpha = 0.5;
    }
    return _alphView;
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
