//
//  FriendDetailFlagCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendDetailFlagCell : UITableViewCell
/*
 评价详情label  cell
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authoLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (void)configCell:(NSString  *)str ;
@end
