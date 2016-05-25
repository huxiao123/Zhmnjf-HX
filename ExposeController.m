//
//  ExposeController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ExposeController.h"
#import "ExposeCell.h"
#import "ExposeTopViewCell.h"
#import "SelectExposeController.h"

@interface ExposeController ()

@end

@implementation ExposeController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    ShowNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 0.1;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0||section==1) {
        return 0.1;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        ExposeTopViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ExposeTopViewCell" owner:self options:nil].lastObject;
        [self addTapGesture:cell];
        return cell;
    }
   else {
       ExposeCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ExposeCell" owner:self options:nil].lastObject;
       return cell;
    }
    
    return nil;
}

- (void)addTapGesture:(ExposeTopViewCell *)cell{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
    cell.ShareExposeImage.userInteractionEnabled = YES;
    
    [cell.ShareExposeImage addGestureRecognizer:tapGesture];
}

- (void)tapGesture{
    SelectExposeController *control = [[SelectExposeController alloc]init];
    [self.navigationController pushViewController:control animated:YES];
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
