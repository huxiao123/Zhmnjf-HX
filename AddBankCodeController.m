//
//  AddBankCodeController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "AddBankCodeController.h"


@interface AddBankCodeController ()
{
    
}
@end

@implementation AddBankCodeController
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
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return 3;
    }
    if (section==2) {
        return 1;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section==0) {
        return @"姓名或企业名称";
    }
    if (section==1) {
        return @"请尽量准确填写支持名称,银行精确匹配后,充值提现等操作响应速度更快";
    }

    
    return nil;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            EnterTextFieldCell *cell = [[NSBundle mainBundle]loadNibNamed:@"EnterTextFieldCell" owner:self options:nil].lastObject;
            [cell configCell:@"持卡人" contentPlaceholder:@"请输入持卡人姓名"];
            return cell;
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                case 1:
                {
                    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    if (indexPath.row==0) {
                        cell.textLabel.text = @"开户行";
                        cell.detailTextLabel.text = @"";
                    }
                    if (indexPath.row==1) {
                        cell.textLabel.text = @"开户地";
                        cell.detailTextLabel.text = @"";
                    }
                    return cell;
                }
                    break;
                case 2:
                {
                    EnterTextFieldCell *cell = [[NSBundle mainBundle]loadNibNamed:@"EnterTextFieldCell" owner:self options:nil].lastObject;
                    [cell configCell:@"支行名称" contentPlaceholder:@"请输入支行名称"];
                    return cell;

                }
                    break;
  
                default:
                    break;
            }
         }
            break;
        case 2:
        {
            EnterTextFieldCell *cell = [[NSBundle mainBundle]loadNibNamed:@"EnterTextFieldCell" owner:self options:nil].lastObject;
            [cell configCell:@"卡号" contentPlaceholder:@"请输入卡号"];
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==2) {
        return 115;
    }
    return 40;
}

/*
 @param :leading ->15  ios tabelView左边距默认为15
 */
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section==2) {
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 25, ScreeWidth, 115)];
        bgView.backgroundColor = [UIColor clearColor];
        bgView.userInteractionEnabled = YES;
        
        UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, ScreeWidth-15, 25)];
        descLabel.numberOfLines = 0;
        descLabel.font = [UIFont systemFontOfSize:14];
        descLabel.textColor = [UIColor grayColor];
        descLabel.text = @"绑定银行卡开户名称必须和乾多多开户时填写的名称一致";
        descLabel.lineBreakMode = NSLineBreakByWordWrapping;//NSLineBreakByWordWrapping
        [bgView addSubview:descLabel];
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(15, 45, ScreeWidth-15*2, 45);
        [sureBtn setTitle:@"绑定" forState:UIControlStateNormal];
        [sureBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
        [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(bindCodeAction) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:sureBtn];
        return bgView;
 
    }
    return nil;
   
}

- (void)bindCodeAction{
    NSLog(@"绑定");
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
