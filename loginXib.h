//
//  loginXib.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "RegisterXib.h"
#import "SetPassWordXib.h"

@interface loginXib : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;

- (IBAction)sureBtnAction:(id)sender;
- (IBAction)registerBtnAction:(id)sender;
- (IBAction)setMMBtnAction:(id)sender;

@end
