//
//  ReceiveGoodsDetailCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiveGoodsDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *receivePeople;
@property (weak, nonatomic) IBOutlet UILabel *telPhone;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

- (void)configCell:(NSArray *)array;
@end
