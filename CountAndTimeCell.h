//
//  CountAndTimeCell.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DACircularProgressView.h"
#import "DALabeledCircularProgressView.h"

@interface CountAndTimeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (weak, nonatomic) IBOutlet UIView *CurcieView;
@property (strong, nonatomic) DALabeledCircularProgressView *labeledProgressView;
@property (weak, nonatomic) IBOutlet UILabel *backBtnAction;
@property (weak, nonatomic) IBOutlet UILabel *authBtnAction;

- (void)configCell;
@end
