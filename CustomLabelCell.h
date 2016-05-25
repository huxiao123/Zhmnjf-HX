//
//  CustomLabelCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLabelCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *seleteImage;

- (void)configCell:(NSArray *)array;
@end
