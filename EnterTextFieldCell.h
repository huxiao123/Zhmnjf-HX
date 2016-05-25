//
//  EnterTextFieldCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterTextFieldCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *EnterTextField;


- (void)configCell:(NSString *)title contentPlaceholder:(NSString *)content;
@end
