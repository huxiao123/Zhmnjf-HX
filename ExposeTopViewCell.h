//
//  ExposeTopViewCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 晒单
 */
@interface ExposeTopViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIImageView *ShareExposeImage;

- (IBAction)backBtnAction:(id)sender;

@end
