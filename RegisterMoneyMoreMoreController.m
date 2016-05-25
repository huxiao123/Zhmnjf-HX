//
//  RegisterMoneyMoreMoreController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "RegisterMoneyMoreMoreController.h"
#import "EnterTextFieldCell.h"
#import "MoneyMoreMoreDescLabelCell.h"
#import "TitleDescLabel.h"

@interface RegisterMoneyMoreMoreController ()<UITextFieldDelegate>

@end

@implementation RegisterMoneyMoreMoreController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
    ShowNavigationBar;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.tabBarController.tabBar setHidden:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==4) {
        return 100;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    switch (indexPath.section) {
        case 0:
        { TitleDescLabel *cell = [[NSBundle mainBundle]loadNibNamed:@"TitleDescLabel" owner:self options:nil].lastObject;
            return cell;
        }
            break;
        case 1:
        case 2:
        case 3:
        {
            EnterTextFieldCell *cell = [[NSBundle mainBundle]loadNibNamed:@"EnterTextFieldCell" owner:self options:nil].lastObject;
            cell.EnterTextField.delegate = self;
            
            if (indexPath.section==1) {
                [cell configCell:@"姓名" contentPlaceholder:@"请输入姓名"];
                cell.EnterTextField.tag = 1;
                
            }else if (indexPath.section==2){
                [cell configCell:@"身份证" contentPlaceholder:@"请输入身份证"];
                cell.EnterTextField.tag = 2;;

                
            }else{
                [cell configCell:@"邮箱" contentPlaceholder:@"请输入邮箱"];
                cell.EnterTextField.tag = 3;;

            }
            return cell;
        }
            break;
        case 4:
        {
            MoneyMoreMoreDescLabelCell *cell = [[NSBundle mainBundle]loadNibNamed:@"MoneyMoreMoreDescLabelCell" owner:self options:nil].lastObject;
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==4) {
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth,100)];
        bgView.backgroundColor = [UIColor clearColor];
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(15, 20, ScreeWidth-15*2, 45);
        [sureBtn setTitle:@"提现" forState:UIControlStateNormal];
        [sureBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
        [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(sureBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:sureBtn];
        
        UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 20+45+15, ScreeWidth-15*2, 20)];
        descLabel.font = [UIFont systemFontOfSize:11];
        descLabel.textColor = [UIColor grayColor];
        descLabel.textAlignment = NSTextAlignmentCenter;
        descLabel.text = @"即将跳转至第三方支付平台———乾多多支付";
        [bgView addSubview:descLabel];
        
        return bgView;
    }
    return nil;
}

#pragma mark    ------UITextFiledDelegate----
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        return NO;
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
    
    BOOL ret = nil;
    if (textField.tag==1) {
       ret = [RegularExpression validateNickname:textField.text];
        if (!ret) {
            [self getMyUnitilityAlerty:@"姓名" textField:textField];
        }
        
    }else if (textField.tag==2){
       ret = [RegularExpression validateIdentityCard:textField.text];
        if (!ret) {
            [self getMyUnitilityAlerty:@"身份证" textField:textField];
        }
        
    }else{
        ret = [RegularExpression validateEmail:textField.text];
        if (!ret) {
            [self getMyUnitilityAlerty:@"邮箱" textField:textField];
        }
    }
  
   
}

- (void)getMyUnitilityAlerty:(NSString *)title textField:(UITextField *)textField{
    textField.text = @"";
    NSString *contont = [NSString stringWithFormat:@"%@格式输入有误！\n请重新输入",title];
     [MyUnitility configAlertView:self contont:contont title:nil buttonTitle:@"我知道了"];
}

- (void)sureBtnAction{
    
    NSLog(@"提现");
}

- (void)explainBtnAction{
   
    
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
