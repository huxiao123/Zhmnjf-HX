//
//  ReceiveAddressEditView.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ReceiveAddressController.h"
#import "EnterTextFieldCell.h"
#import "AddressPickView.h"
#import "ShowReceiveAddressController.h"
#import "SaveReceiveAddressDB.h"
@interface ReceiveAddressController ()<UITextFieldDelegate>
{
    NSArray *_titleArray;
    NSInteger _flag;
}
@end

@implementation ReceiveAddressController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    ShowNavigationBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _flag = 0;
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self titleArray];
    [self dataSoucre];
}

- (void)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"收货人",
                        @"手机号码 ",
                        @"邮编 ",
                        @"所属区域",
                        @"详细地址 ",
                        @"设置为默认地址"];
    }
}

- (void)dataSoucre{
    
    if (self.addId) {
        NSArray *addressArray = [[SaveReceiveAddressDB shareManager]selectAllData];
        NSArray *subAddress = [NSArray array];
        for (NSArray *subArray in addressArray) {
            for (NSInteger i=0; i<subArray.count-1; i++) {
                if ([subArray[4] isEqualToString:self.addId]) {
                    subAddress = subArray;
                    break;
                }
            }
        }
        
        NSArray *area_detailAddress = [subAddress[2] componentsSeparatedByString:@"-"];
        self.dataSource = [NSMutableArray arrayWithObjects:
                           subAddress[0],
                           subAddress[1],
                           subAddress[5],
                           area_detailAddress[0],
                           area_detailAddress[1],
                           subAddress[3], nil];
        _flag = [NSString stringWithFormat:@"%@",subAddress[3]].integerValue;

    }else{
        self.dataSource = [NSMutableArray arrayWithObjects:
                           @"",
                           @"",
                           @"",
                           @"",
                           @"",
                           @"", nil];

    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 100;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    switch (indexPath.row) {
        case 0:
        case 1:
        case 2:
        case 4:
        {
             EnterTextFieldCell *cell = [[NSBundle mainBundle]loadNibNamed:@"EnterTextFieldCell" owner:self options:nil].lastObject;
            cell.EnterTextField.delegate = self;
            if (_flag==1 || _flag==0) {
                cell.EnterTextField.text = self.dataSource[indexPath.row];
            }
            
            if (indexPath.row==0) {
    
                [cell configCell:_titleArray[indexPath.row] contentPlaceholder:@"请输收件人"];
                cell.EnterTextField.tag = 0;
                
            }else
            if (indexPath.row==1) {
                [cell configCell:_titleArray[indexPath.row] contentPlaceholder:@"请输入手机号码"];
                cell.EnterTextField.tag = 1;
                cell.EnterTextField.keyboardType = UIKeyboardTypeNumberPad;
                
            }else if (indexPath.row==2) {
                [cell configCell:_titleArray[indexPath.row] contentPlaceholder:@"请输入所在城市邮编"];
                cell.EnterTextField.tag = 2;
                cell.EnterTextField.keyboardType = UIKeyboardTypeNumberPad;
            }
            else{
                [cell configCell:_titleArray[indexPath.row] contentPlaceholder:@"输入您的详细地址"];
                cell.EnterTextField.tag = 4;
            }
            return cell;
        }
            break;
        case 3:{
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = _titleArray[indexPath.row];
            cell.detailTextLabel.text = self.dataSource[indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
            break;
        }
        case 5:{
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = _titleArray[indexPath.row];
            [self createSwitch:cell];
            return cell;
            break;
        }
        default:
            break;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==3) {
        AddressPickView *addressPickView = [AddressPickView shareInstance];
        [self.view addSubview:addressPickView];
        addressPickView.block = ^(NSString *province,NSString *city,NSString *town){
            
            self.dataSource[3] = [NSString stringWithFormat:@"%@ %@ %@",province,city,town];
            
            NSIndexPath *path = [NSIndexPath indexPathForItem:3 inSection:0];
            [self.BaseTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationNone];
            
        };

    }
   
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, 100)];
    view.backgroundColor = [UIColor clearColor];
    view.userInteractionEnabled = YES;
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(30, 50, ScreeWidth-60, 45);
    [saveBtn setTitle:@"保存并使用" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:saveBtn];
    return view;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.dataSource[textField.tag] = textField.text;
}

- (void)saveBtnAction{
    
    BOOL isCommit = [self isCommitData];
    if (isCommit) {
        
        //不管是插入还是修改，都要先判断当前地址是否为默认，如果是要判断数据库中是否已经存在默认，如果有，要修改
        NSArray *flagArray = [NSArray array];
        if (_flag==1) {
            //找出已经存在的默认地址
            NSArray *addressArray = [[SaveReceiveAddressDB shareManager]selectAllData];
            if (addressArray.count!=0) {
                for (NSArray *subArray in addressArray) {
                    for (NSInteger i=0 ;i<subArray.count;i++ ) {
                        if ([subArray[3] isEqualToString:@"1"]) {
                            flagArray = subArray;
                            break;
                        }
                    }
                }
                //将默认地址修改为非默认地址
                NSString *idStr = flagArray[4];
                NSLog(@"%@",idStr);
                [[SaveReceiveAddressDB shareManager]updateWith:idStr andValue:0];

            }
        }
        
        if (self.isUpadate) {
            NSArray *dataArray = @[self.dataSource[0],
                                   self.dataSource[1],
                                   [NSString stringWithFormat:@"%@-%@",
                                    self.dataSource[3],
                                    self.dataSource[4]],
                                   [NSString stringWithFormat:@"%ld",_flag],
                                   self.dataSource[2],
                                   self.addId];
            NSLog(@"id%@",self.addId);
            SaveReceiveAddressDB *saveDB = [[SaveReceiveAddressDB alloc]init];
            
            BOOL isSuccess = [saveDB updateWith:dataArray];
            if (isSuccess) {
                [self.navigationController dismissViewControllerAnimated:NO completion:nil];
                
            }
            
            
        }else{
            NSArray *dataArray = @[self.dataSource[0],
                                   self.dataSource[1],
                                   [NSString stringWithFormat:@"%@-%@",
                                    self.dataSource[3],
                                    self.dataSource[4]],
                                   [NSString stringWithFormat:@"%ld",_flag],
                                   self.dataSource[2]];
            
            SaveReceiveAddressDB *saveDB = [[SaveReceiveAddressDB alloc]init];
            
            BOOL isSuccess = [saveDB insertModel:dataArray];
            if (isSuccess) {
                [self.navigationController dismissViewControllerAnimated:NO completion:nil];
                
            }else{
                NSLog(@"数据库插入失败");
            }

        }
       
    }
}

- (BOOL)isCommitData{
    //设置为默认地址  不用检查
    for (NSInteger i=0; i<self.dataSource.count-1; i++) {
        if ([self.dataSource[i] isEqualToString:@""]) {
            NSString *contont = [NSString stringWithFormat:@"请填写%@",_titleArray[i]];
            [MyUnitility configAlertView:self contont:contont title:@"提示" buttonTitle:@"我知道了"];
            return NO;
            
        }

    }
    return YES;
}

//效果图上switch的宽度为75 长度为23
- (void)createSwitch:(UITableViewCell *)cell{
    UISwitch *userSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(ScreeWidth-(75/2+15),5, 75/2, cell.contentView.frame.size.height-5)];
    [userSwitch addTarget:self action:@selector(setUserSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:userSwitch];
    if (_flag==1) {
        userSwitch.on = YES;
    }
}

/*
 param:_flag = 1  默认收货地址
       _flag = 0  非默认收货地址
 */
- (void)setUserSwitch:(UISwitch *)switchs{
    if (switchs.on) {
        _flag = 1;
        
    }else{
        _flag = 0;
    }
    NSLog(@"滑动%ld",_flag);
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
