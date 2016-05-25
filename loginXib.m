//
//  loginXib.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "loginXib.h"

@interface loginXib ()<UITextFieldDelegate>

@end

@implementation loginXib

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *holderText = @"请输入用户名/手机号码";
     NSString *holderText2 = @"请输入登陆密码";
    self.userTextField.delegate = self;
    self.userTextField.tag = 1;
    self.passTextField.delegate = self;
    self.passTextField.tag = 2;
    
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
       NSMutableAttributedString *placeholder2 = [[NSMutableAttributedString alloc] initWithString:holderText2];
    
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:NSMakeRange(0, holderText.length)];
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:16]
                        range:NSMakeRange(0, holderText.length)];
    
    [placeholder2 addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:NSMakeRange(0, holderText2.length)];
    [placeholder2 addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:16]
                        range:NSMakeRange(0, holderText2.length)];
    self.userTextField.attributedPlaceholder = placeholder;
    self.passTextField.attributedPlaceholder = placeholder2;
    
}

#pragma mark ----UITextFiledDelegate---
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        return NO;
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
    if (textField.tag==1) {
        
        
    }else{
        
    }
}

- (IBAction)sureBtnAction:(id)sender {
    MainViewController *mainCtrol = [[MainViewController alloc]init];
    mainCtrol.navigationItem.title = @"首页";
    [self presentViewController:mainCtrol animated:NO completion:nil];
}

- (IBAction)registerBtnAction:(id)sender {
    RegisterXib *registerCtrol = [[RegisterXib alloc]init];
    [self presentViewController:registerCtrol animated:YES completion:nil];
}

- (IBAction)setMMBtnAction:(id)sender {
    SetPassWordXib *setPassWordCtrol = [[SetPassWordXib alloc]init];
  [self presentViewController:setPassWordCtrol animated:YES completion:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.userTextField resignFirstResponder];
    [self.passTextField resignFirstResponder];
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
