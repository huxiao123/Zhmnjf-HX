//
//  TheCalculationProcess.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "TheCalculationProcess.h"
#import "TheCalculationProcessCell.h"

@interface TheCalculationProcess ()

@end

@implementation TheCalculationProcess

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    ShowNavigationBar;
    [self.tabBarController.tabBar setHidden:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TheCalculationProcessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TheCalculationId"];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"TheCalculationProcessCell" owner:self options:nil].lastObject;
    }
    
    if (indexPath.row==0) {
        cell.nameLabel.textColor = [UIColor redColor];
        cell.timeLabel.textColor = [UIColor redColor];
        cell.acontLabel.textColor = [UIColor redColor];
        
        cell.nameLabel.text = @"用户名";
        cell.timeLabel.text = @"购买时间";
        cell.acontLabel.text = @"转化数值";
        
        return cell;
    }else{
        cell.nameLabel.font = [UIFont systemFontOfSize:12];
        cell.timeLabel.font = [UIFont systemFontOfSize:12];
        cell.acontLabel.font = [UIFont systemFontOfSize:12];
        
        cell.nameLabel.text = @"xxxx_yyy";
        cell.timeLabel.text = @"10:10:10";
        cell.acontLabel.text = @"101010";
        return cell;
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
