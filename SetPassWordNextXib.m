//
//  SetPassWordNextXib.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "SetPassWordNextXib.h"

@interface SetPassWordNextXib ()

@end

@implementation SetPassWordNextXib

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.setPassTextField resignFirstResponder ];
    [self.setPassTextFieldTwo resignFirstResponder];
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

- (IBAction)sureBtnAction:(id)sender {
    MainViewController *mainCtrol = [[MainViewController alloc]init];
    [self presentViewController:mainCtrol animated:YES completion:nil];
}
- (IBAction)BackBtnAction:(id)sender {
    SetPassWordXib *setPassWordCtrol = [[SetPassWordXib alloc]init];
    [self dismissViewControllerAnimated:setPassWordCtrol completion:nil];
}
@end
