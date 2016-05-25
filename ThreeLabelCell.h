//
//  ThreeLabelCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeLabelCell : UITableViewCell
/*
 有三个文字描述的label cell
 */
@property (weak, nonatomic) IBOutlet UILabel *XLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *threeLabel;

@end
