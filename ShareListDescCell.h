//
//  ShareListDescCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareListDescCell : UITableViewCell
/*
 晒单列表-描述cell
 */
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

- (void)configCell:(NSString *)str andControlFlag:(NSInteger)flag;
@end
