//
//  ModifySafeInfoController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ModifySafeInfoController.h"

@interface ModifySafeInfoController ()<UITextFieldDelegate>

@end

@implementation ModifySafeInfoController

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
    self.view.backgroundColor = [UIColor whiteColor];
    [self configModifyUI];
    
}

//配置修改密码UI
- (void)configModifyUI{

    [self initTopDescribeLabel];
    [self initEnterModels];
    [self initSureBtn];
}

//配置顶部文字描述Label
- (void)initTopDescribeLabel{
    
    UILabel *describeLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 30+64, ScreeWidth-15*2, 15)];
    describeLabel.textColor = [UIColor grayColor];
    describeLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:describeLabel];
    
    UILabel *line1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 64+30+15+1+5, ScreeWidth, 1)];
    line1.backgroundColor = [UIColor grayColor];
    line1.alpha = 0.3;
    [self.view addSubview:line1];

    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 64+30+15+44+1+5, ScreeWidth, 1)];
    line2.backgroundColor = [UIColor grayColor];
    line2.alpha = 0.3;
    [self.view addSubview:line2];
    
    if (self.modifyType==PasswordType) {
        describeLabel.text = [NSString stringWithFormat:@"请输入%@收到的短信验证码",@"178*******3119"];
        
    }else if (self.modifyType==EmailType){
        describeLabel.text = @"请真实填写邮箱信息,该邮箱用于接收电子邮件合同等相关信息";
    }
}

//配置输入模块
- (void)initEnterModels{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 64+30+15+5, 60, 44)];
    titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:titleLabel];
    
    UITextField *enterField = [[UITextField alloc]initWithFrame:CGRectMake(15+60, 64+30+15+5, ScreeWidth-15-60-100, 44)];
    enterField.returnKeyType = UIReturnKeyDone;
    enterField.borderStyle = UITextBorderStyleNone;
    enterField.delegate = self;
    [self.view addSubview:enterField];
    
    UIButton *getCode = [UIButton buttonWithType:UIButtonTypeCustom];
    getCode.frame = CGRectMake(15+60+ScreeWidth-15-60-100, 64+30+15+5, 100, 44);
    [getCode setTitle:@"发送验证码" forState:UIControlStateNormal];
    [getCode setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:getCode];
    
    UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 64+30+15+5+44+1, ScreeWidth-15*2, 44)];
    descLabel.text = @"请在邮箱中进行验证";
    descLabel.textColor = [UIColor grayColor];
    [self.view addSubview:descLabel];
    
    titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:titleLabel];
    
    if (self.modifyType==PasswordType) {
        titleLabel.text = @"验证";
        enterField.keyboardType = UIKeyboardTypeNumberPad;
        enterField.placeholder = @"请输入验证码";
        
    }else if (self.modifyType==EmailType){
        getCode.hidden = YES;
       titleLabel.text = @"邮箱";
        enterField.placeholder = @"请输入邮箱";
    }
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
    if (self.modifyType==EmailType){
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

//配置确认按钮
- (void)initSureBtn{
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(15, ScreeHeight-94, ScreeWidth-15*2, 45);
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
    [self.view addSubview:sureBtn];
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
