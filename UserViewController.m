//
//  UserViewController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "UserViewController.h"
#import "TopViewCell.h"
#import "RebPacketStandings.h"
#import "SafeInfoController.h"
#import "RebPackeController.h"
#import "StandingsViewController.h"
#import "ExposeController.h"
#import "ReceiveAddressController.h"
#import "ShowReceiveAddressController.h"
#import "SaveReceiveAddressDB.h"
#import "OpenAnAccountController.h"
#import "SetingController.h"

@interface UserViewController ()
{
    NSMutableArray *_imageArray;
    NSArray *_titleArray;
}
@end

@implementation UserViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setimageArray];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    ShowNavigationBar;
}

- (void)setimageArray{
    _imageArray = [NSMutableArray arrayWithObjects:
                       @"双乾@2x",
                       @"我的账单@2x",
                       @"安全信息@2x",
                       @"收货地址@2x",
                       @"设置@2x", nil];
    
    _titleArray = @[@"支付账户",
                    @"我的晒单",
                    @"安全信息",
                    @"收货地址",
                    @"设置"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
        
    }else{
        return 1;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==5) {
        return 50;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:cellId];
    }
    
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row==0) {
                TopViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"TopViewCell"
                                                                 owner:self options:nil].lastObject;
                return cell;

            }if(indexPath.row==1){
                RebPacketStandings *rebPacket = [[NSBundle mainBundle]loadNibNamed:@"RebPacketStandings"
                                                                             owner:self options:nil].lastObject;
                [self addTatGesture:rebPacket];
                return rebPacket;
            }
        }
            break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:{
            cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.section-1]];
            cell.textLabel.text = _titleArray[indexPath.section-1];
            return cell;
            break;
            }
            
        default:
            break;
    }
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 1:{
            OpenAnAccountController *control = [[OpenAnAccountController alloc]init];
            [self.navigationController pushViewController:control animated:YES];
            break;
        }
        case 2:
        {
            ExposeController *control = [[ExposeController alloc]init];
             [self.navigationController pushViewController:control animated:YES];
        }
            break;
        case 3:
        {
            SafeInfoController *control = [[SafeInfoController alloc]init];
            control.title = @"安全信息";
            [self.navigationController pushViewController:control animated:YES];

        }
            break;
        case 4:
        {
            [self.tabBarController.tabBar setHidden:YES];
            //判断有无收获地址
            NSArray *dataArray =  [[SaveReceiveAddressDB shareManager]selectAllData];
            
            if (dataArray.count == 0) {
                
                ReceiveAddressController *control = [[ReceiveAddressController alloc]init];
                control.title = @"编辑收获地址";
                [self.navigationController pushViewController:control animated:YES];
                
            }else{
                ShowReceiveAddressController *control =[[ShowReceiveAddressController alloc]init];
                control.title = @"收获地址";
                [self.navigationController pushViewController:control animated:YES];
            }

            
        }
            break;
        case 5:{
            SetingController *control = [[SetingController alloc]init];
            control.title = @"设置";
            [self.navigationController pushViewController:control animated:YES];
        }
            break;
        default:
            break;
    }
    
}

- (void)addTatGesture:(RebPacketStandings *)cell{
    
    UITapGestureRecognizer *leftTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftTapGesture)];
    UITapGestureRecognizer *rightTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightTapGesture)];
    
    cell.label1.userInteractionEnabled = YES;
    cell.label2.userInteractionEnabled = YES;
    cell.label3.userInteractionEnabled = YES;
    cell.label4.userInteractionEnabled = YES;
    
    [cell.label2 addGestureRecognizer:leftTapGesture];
    
    [cell.label3 addGestureRecognizer:rightTapGesture];
    [cell.label4 addGestureRecognizer:rightTapGesture];
}

- (void)leftTapGesture{
    RebPackeController *contrl =[[RebPackeController alloc]init];
    [self.navigationController pushViewController:contrl animated:YES];
}

- (void)rightTapGesture{
    StandingsViewController *contrl = [[StandingsViewController alloc]init];
    [self.navigationController pushViewController:contrl animated:YES];


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
