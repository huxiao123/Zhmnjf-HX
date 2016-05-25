//
//  StateTableViewCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 状态显示cell
 */
@interface StateTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *finishImageView;

@end
