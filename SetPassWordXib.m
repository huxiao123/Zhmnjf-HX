//
//  SetPassWordXib.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "SetPassWordXib.h"

@interface SetPassWordXib ()<UITextFieldDelegate>

@end

@implementation SetPassWordXib

- (void)viewDidLoad {
    [super viewDidLoad];
    self.EnterCodeTextField.delegate = self;
    self.EnterPhoneTextField.delegate = self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.EnterPhoneTextField resignFirstResponder];
    [self.EnterCodeTextField resignFirstResponder];
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

- (IBAction)NextBtnAction:(id)sender {
    SetPassWordNextXib *SetPassWordCtrol = [[SetPassWordNextXib alloc]init];
    [self presentViewController:SetPassWordCtrol animated:YES completion:nil];
    
}

- (IBAction)BackBtnAction:(id)sender {
    loginXib *loginCtrol = [[loginXib alloc]init];
    [self dismissViewControllerAnimated:loginCtrol completion:nil];
}
@end
