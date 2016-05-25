//
//  SetingController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "SetingController.h"

@interface SetingController ()
{
    NSInteger _flag;
}
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation SetingController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    SetNavigationBarBackgroundImage;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (NSArray *)titleArray{
    if (!_titleArray) {
        NSArray *sectionArray1 = @[@"新活动推送",@"版本更新(1.0.1)"];
        NSArray *sectionArray2 = @[@"退出"];
        _titleArray = @[sectionArray1,sectionArray2];
    }
    return _titleArray;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"",@"", nil];
    }
    return _dataArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.titleArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section==0) {
         cell.textLabel.text = self.titleArray[indexPath.section][indexPath.row];
        switch (indexPath.row) {
            case 0:
            {
                [self createSwitch:cell];
            }
                break;
            default:
                break;
        }
        
    }else{
         cell.textLabel.text = self.titleArray[indexPath.section][indexPath.row];

    }
    return cell;
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
