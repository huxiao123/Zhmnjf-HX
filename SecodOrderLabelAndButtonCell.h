//
//  SecodOrderLabelAndButtonCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SecodOrderLabelAndButtonCell : UITableViewCell

- (IBAction)finishBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;


- (void)config:(NSString *)title btnImage:(NSString *)path isHiddenBtn:(BOOL)isHidden;
@end
