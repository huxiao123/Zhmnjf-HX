//
//  ZeroBuyDetailViewCtroller.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ZeroBuyDetailViewCtroller.h"
#import "GoodTopViewCell.h"
#import "ZeroBuyDescCell.h"
#import "TopViewCell.h"
#import "CountAndTimeCell.h"
#import "CustomSelectList.h"
#import "NowRushViewCtroller.h"

@interface ZeroBuyDetailViewCtroller ()

@property (nonatomic,strong)NSArray  *titleArray;
@property (nonatomic,strong)UIView *alphView;
@end

@implementation ZeroBuyDetailViewCtroller

- (void)viewWillDisappear:(BOOL)animated{
   
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewWillAppear:(BOOL)animated{
   
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"商品需求",@"参与记录",@"晒单分享"];
    }
    return _titleArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==3) {
        return 3;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
        
    }else if (section==1){
        return 44;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell  *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = nil;
    if (indexPath.section==0) {
        GoodTopViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"GoodTopViewCell" owner:self options:nil].lastObject;
        return cell;

    }
    if (indexPath.section==1) {
        ZeroBuyDescCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ZeroBuyDescCell" owner:self options:nil].lastObject;
        return cell;

    }
    if (indexPath.section==2) {
        CountAndTimeCell *cell = [[NSBundle mainBundle]loadNibNamed:@"CountAndTimeCell" owner:self options:nil].lastObject;
        [cell configCell];
        [self addbackTapGuseter:cell.backBtnAction];
        [self addauthTapGuseter:cell.authBtnAction];
        return cell;
        
    }
    if (indexPath.section==3) {
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        cell.textLabel.text = self.titleArray[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
         }
    if (indexPath.section==4) {
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createTakePart:cell];
        return cell;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, 44)];
        view.backgroundColor = [UIColor whiteColor];
        
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"选择按钮"]];
        image.frame = CGRectMake(15, (44-21)/2, 21, 21);
        [view addSubview:image];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15+21+10, (44-21)/2, ScreeWidth-46, 21)];
        titleLabel.text = @"锁定期过后返还参与金额";
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1];
        [view addSubview:titleLabel];
        return view;
    }
    return nil;
}
- (void)createTakePart:(UITableViewCell *)cell{
    UIButton *takePart = [UIButton buttonWithType:UIButtonTypeCustom];
    takePart.frame = CGRectMake(ScreeWidth-113, 0, 113,44);
    [takePart setBackgroundImage:[UIImage imageNamed:@"结算背景@2x"] forState:UIControlStateNormal];
    [takePart setTitle:@"立即抢购" forState:UIControlStateNormal];
    [takePart addTarget:self action:@selector(takePartAction) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:takePart];
    
}

- (void)takePartAction{
    NowRushViewCtroller *nowRush = [[NowRushViewCtroller alloc]init];
    [self.navigationController pushViewController:nowRush animated:YES];
}

- (void)addbackTapGuseter:(UILabel *)label{
    
}

- (void)addauthTapGuseter:(UILabel *)label{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(authTapGesure)];
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:tapGesture];
}

- (void)authTapGesure{
    CGRect rect = CGRectMake((ScreeWidth-270)/2, (ScreeHeight-281)/2, 270, 281);
    CustomSelectList *list = [[CustomSelectList alloc]initWithFrame:rect];
    
    list.removeCustomViewBlock = ^{                   
        [self.alphView removeFromSuperview];
    };
    [self.view addSubview:self.alphView];
    [self.view addSubview:list];


}

- (UIView *)alphView{
    if (!_alphView) {
        _alphView = [[UIView alloc]initWithFrame:self.view.bounds];
        _alphView.backgroundColor = [UIColor blackColor];
        _alphView.alpha = 0.5;
    }
    return _alphView;
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
