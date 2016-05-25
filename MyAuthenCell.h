//
//  MyAuthenCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAuthenCell : UITableViewCell
/*
 查看我的抢购凭证
 */
@property (weak, nonatomic) IBOutlet UILabel *MyAuthenLabel;

- (void)configCell;
@end
