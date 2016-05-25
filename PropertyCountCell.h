//
//  PropertyCountCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyCountCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelAction;//充值


@property (weak, nonatomic) IBOutlet UILabel *descLabel;
- (void)configCell:(NSString *)title content:(NSString *)content isHiddenLabel:(BOOL)isHidden;

@end
