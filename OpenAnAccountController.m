//
//  OpenAnAccountController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "OpenAnAccountController.h"
#import "OpenAnAccountTopCellTableViewCell.h"

@interface OpenAnAccountController ()

@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation OpenAnAccountController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    ShowNavigationBar;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    SetNavigationBarBackgroundImage;
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self setNavigationItem];
}

- (void)setNavigationItem{
    UIButton *item = [UIButton buttonWithType:UIButtonTypeSystem];
    item.frame = CGRectMake(0, 0, 100, 30);
    [item setTitle:@"充值记录" forState:UIControlStateNormal];
    item.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [item addTarget:self action:@selector(itemAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *ButtonItem = [[UIBarButtonItem alloc]initWithCustomView:item];
    self.navigationItem.rightBarButtonItem = ButtonItem;
}

- (void)itemAction{
    
}

- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"姓名",@"身份证",@"邮箱"];
    }
    return _titleArray;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
    }
    return _dataArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.titleArray.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.1;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==3) {
        return 100;
    }
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section==3) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, 100)];
        view.backgroundColor = [UIColor clearColor];
        view.userInteractionEnabled = YES;
        
        UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        nextBtn.frame = CGRectMake(30, 50, ScreeWidth-60, 45);
        [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [nextBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
        [nextBtn addTarget:self action:@selector(nextBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:nextBtn];
        return view;

    }
    return nil;
}

- (void)nextBtnAction{
    NSLog(@"-----");
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        OpenAnAccountTopCellTableViewCell
    *cell = [[NSBundle mainBundle]loadNibNamed:@"OpenAnAccountTopCellTableViewCell" owner:self options:nil].lastObject;
        return cell;
        
    }else{
         EnterTextFieldCell *cell = [[NSBundle mainBundle]loadNibNamed:@"EnterTextFieldCell" owner:self options:nil].lastObject;
        switch (indexPath.section) {
            case 1:
            {
                cell.EnterTextField.tag = 1;
                [cell configCell:self.titleArray[indexPath.section-1] contentPlaceholder:@"请输入姓名"];
                return cell;
            }
                break;
            case 2:
            {
                cell.EnterTextField.tag = 2;
                [cell configCell:self.titleArray[indexPath.section-1] contentPlaceholder:@"请输入身份证"];
                return cell;
            }
                break;
            case 3:
            {
                cell.EnterTextField.tag = 3;
                [cell configCell:self.titleArray[indexPath.section-1] contentPlaceholder:@"请输入邮箱"];
                return cell;
            }
                break;
            default:
                break;
        }
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
