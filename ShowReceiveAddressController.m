//
//  ShowReceiveAddressController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ShowReceiveAddressController.h"
#import "CustomLabelCell.h"
#import "SaveReceiveAddressDB.h"
#import "CommitOrderController.h"
#import "ReceiveAddressController.h"

@interface ShowReceiveAddressController ()

@end

@implementation ShowReceiveAddressController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    ShowNavigationBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self loadDataSource];
    
}

- (IBAction)onLibraryButtonClicked:(id)sender {
    
    CommitOrderController *Commit = [[CommitOrderController alloc]init];
//    [self performSegueWithIdentifier:@"CommitOrderController" sender:self];
    [self dismissViewControllerAnimated:Commit completion:nil];
    
}

- (void)loadDataSource{
   
    SaveReceiveAddressDB *addressDB = [[SaveReceiveAddressDB alloc]init];
    self.dataSource = [NSMutableArray arrayWithArray:[addressDB selectAllData]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *customCellId = @"cellId";
    CustomLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:customCellId];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"CustomLabelCell" owner:self options:nil].lastObject;
    }
    [cell configCell:self.dataSource[indexPath.row]];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, 100)];
    view.backgroundColor = [UIColor clearColor];
    view.userInteractionEnabled = YES;
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(30, 50, ScreeWidth-60, 45);
    [saveBtn setTitle:@"添加收获地址" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(addReceiveAddressAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:saveBtn];
    return view;

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //这里先删除数据库中的数据，再删除数组中的数据
        [self deleteSaveDBdata:self.dataSource[indexPath.row]];
        [self.dataSource removeObjectAtIndex:indexPath.row];
    
        // Delete the row from the data source.
        
        [self.BaseTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    //这里没有增加，咱不实现
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   NSArray *dataArray = self.dataSource[indexPath.row];
    ReceiveAddressController *control = [[ReceiveAddressController alloc]init];
    control.title = @"修改收获地址";
    control.addId = dataArray[4];
    control.pushCtorl = ShowReceiveAddressControllerPush;
    control.isUpadate = YES;
    [self.navigationController pushViewController:control animated:YES];
}

- (void)deleteSaveDBdata:(NSArray *)arry{
    NSString *idStr = arry[4];
    NSNumber *idNumber = [NSNumber numberWithInteger:idStr.integerValue];
    [[SaveReceiveAddressDB shareManager]deleteDataWith:idNumber];
}

- (void)addReceiveAddressAction{
    ReceiveAddressController *control = [[ReceiveAddressController alloc]init];
    control.title = @"编辑收获地址";
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
