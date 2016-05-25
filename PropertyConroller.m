//
//  PropertyConroller.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "PropertyConroller.h"
#import "PropertyCountCell.h"

@interface PropertyConroller ()

@end

@implementation PropertyConroller

- (void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资产";
    ShowNavigationBar;
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return 3;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
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
    }else{
        return 4;
    }
    return 0.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.section==0) {
        PropertyCountCell *cell = [[NSBundle mainBundle]loadNibNamed:@"PropertyCountCell" owner:self options:nil].lastObject;
        return cell;
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.textLabel.text = @"总代收金额：200000元";
            cell.imageView.image = [UIImage imageNamed:@"红点"];
            
        }
        if (indexPath.row==1) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
            cell.textLabel.text = @"冻结金额：200000元";
            cell.detailTextLabel.text = @"处于交易中的资金将被短暂冻结";
            cell.imageView.image = [UIImage imageNamed:@"蓝点"];
        }
        if (indexPath.row==2) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"可用余额：200000元";
            cell.detailTextLabel.textColor = [UIColor colorWithRed:77/255.0f green:153/255.0f blue:253/255.0f alpha:1];
            cell.imageView.image = [UIImage imageNamed:@"绿点"];
            
            NSString *textStr = @"提现";
            NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:textStr];
            [attribute addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [textStr length])];
             cell.detailTextLabel.attributedText = attribute;
            
        }
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

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
