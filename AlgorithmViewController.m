//
//  AlgorithmViewController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "AlgorithmViewController.h"
#import "AlgorithmTopViewCell.h"
#import "ThreeLabelCell.h"
#import "TheCalculationProcess.h"

@interface AlgorithmViewController ()

@end

@implementation AlgorithmViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
    ShowNavigationBar;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    HiddenNavigationBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
        
    }else if (section==1){
        return 1;
    }
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section<2) {
        return 10;
    }
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        AlgorithmTopViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"AlgorithmTopViewCell" owner:self options:nil].lastObject;
        return cell;
        
    }else if (indexPath.section==1){
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.imageView.image = [UIImage imageNamed:@"计算结果@2x"];

        cell.textLabel.attributedText = [MyUnitility
                                         setDoubleNSStringColor:@"计算结果=（数值X+数值Y）%商品份数+10000001"
                                         withColor:[UIColor redColor]
                                         andRange:NSMakeRange(6, 3)
                                         andRange:NSMakeRange(10, 3)];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        
        return cell;
        
    }else{
        ThreeLabelCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ThreeLabelCell" owner:self options:nil].lastObject;
        switch (indexPath.row) {
            case 0:
            {
                cell.XLabel.text = @"数值X";
                cell.descLabel.text = @"=该商品购买完成前全站最后50个抢购时间求和";
                NSString *result = @"=2534532523";
                
                cell.threeLabel.attributedText = [MyUnitility
                                                  setNSStringColor:result
                                                  withColor:[UIColor redColor]
                                                  andRange:NSMakeRange(1, result.length-1)];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;
            }
                break;
            case 1:
            {
                cell.XLabel.text = @"数值Y";
                NSString *result = @"=最近一期(0010100101期) ”老时时彩“ 开奖号码";
                cell.descLabel.attributedText = [MyUnitility
                                                 setNSStringColor:result
                                                 withColor:[UIColor redColor]
                                                 andRange:NSMakeRange(6, result.length-19)] ;
                NSString *result2 = @"=正在揭晓...";
                cell.threeLabel.attributedText = [MyUnitility setNSStringColor:result2 withColor:[UIColor redColor] andRange:NSMakeRange(1, result2.length-1) ];
                return cell;
            }
                break;
            default:
                break;
        }
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2 &&
        indexPath.row==0) {
        TheCalculationProcess *control = [[TheCalculationProcess alloc]init];
        [self.navigationController pushViewController:control animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==2) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
        view.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, ScreeWidth-15, 50)];
        label.text = @"老时时彩网址：http://data.shishicai.cn/cqssc/haoma";
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:11];
        [view addSubview:label];
        
        return view;
    }
    return nil;
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
