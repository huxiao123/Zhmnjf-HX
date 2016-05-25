//
//  SafeInfoController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "SafeInfoController.h"
#import "ModifySafeInfoController.h"
#import "RegisterMoneyMoreMoreController.h"

@interface SafeInfoController ()
{
    NSArray *_imageArray;
    NSArray *_titleArray;
    NSMutableArray *_dataArray;
}
@end

@implementation SafeInfoController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    SetNavigationBarBackgroundImage;
    [self.tabBarController.tabBar setHidden:YES];;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.tabBarController.tabBar setHidden:NO];
    HiddenNavigationBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self initAllArray];
    
}

- (void)initAllArray{
    _imageArray = @[@"登录密码@2x",@"手机绑定@2x",@"邮箱绑定@2x",@"双乾@2x"];
    
    _titleArray = @[@"登录密码",@"手机绑定",@"邮箱绑定",@"乾多多开户"];
    
    _dataArray = [NSMutableArray arrayWithObjects:@"修改",@"178******3119",@"未绑定",@"未开通", nil];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.section]];
    cell.textLabel.text = _titleArray[indexPath.section];
    cell.detailTextLabel.text = _dataArray[indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ModifySafeInfoController *control = [[ModifySafeInfoController alloc]init];
   
    RegisterMoneyMoreMoreController *registerControl = [[RegisterMoneyMoreMoreController alloc]init];
    if (indexPath.section==0) {
        control.title = @"密码修改";
        control.modifyType = PasswordType;
        
    }else if (indexPath.section==2){
        control.title = @"邮箱修改";
        control.modifyType = EmailType;
        
    }else if (indexPath.section==3){
        registerControl.title = @"乾多多开户";
         [self.navigationController pushViewController:registerControl animated:YES];
    }
    
    if (indexPath.section!=1 &&
        indexPath.section!=3) {
        [self.navigationController pushViewController:control animated:YES];
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

@end
