//
//  MainViewController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
/*
   -----------设置TabBar+navigation框架 -----------
 */
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationAndTabBar];
}

- (void)setNavigationAndTabBar{
    
    NSArray *titleArray = @[@"账母娘",@"订单",@"我的"];
    NSArray *tabBarImage = @[@"账目娘icon@2x",@"账单icon@2x",@"我的icon@2x"];
//    NSArray *tabBarSelectImage = @[@"账目娘icon@2x",@"账单icon@2x",@"我的icon@2x"];
    
    NSArray *control = @[@"HomeViewController",
                         @"OrderViewController",
                         @"UserViewController"];
    
    NSMutableArray *navArray = [NSMutableArray array];
    for (NSInteger i=0; i<titleArray.count; i++) {
        NSString *controlStr = control[i];
        Class class = NSClassFromString(controlStr);
        UIViewController *viewControl = [[class alloc]init];
        
        NSString *tabBarString = tabBarImage[i];
        viewControl.tabBarItem.image = [UIImage imageNamed:tabBarString];
        
        NSString *title = titleArray[i];
        viewControl.tabBarItem.title = title;
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewControl];
        [navArray addObject:nav];
    }
    self.viewControllers = navArray;
    self.tabBarController.tabBar.alpha = 0.3;
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
