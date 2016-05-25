//
//  GoodTopViewCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodTopViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
- (IBAction)backBtn:(id)sender;

- (void)configCellImage:(NSArray *)arry;
@end
