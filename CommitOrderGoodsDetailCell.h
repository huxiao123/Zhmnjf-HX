//
//  CommitOrderGoodsDetailCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommitOrderGoodsDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;
- (void)config:(NSMutableArray *)data;

@end
