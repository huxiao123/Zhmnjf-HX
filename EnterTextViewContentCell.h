//
//  EnterTextViewContentCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterTextViewContentCell : UITableViewCell
/*
 分享内容+添加照片按钮
 */
- (IBAction)addImageBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addImageBtn;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end
