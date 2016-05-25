//
//  SetPassWordNextXib.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "SetPassWordXib.h"

@interface SetPassWordNextXib : UIViewController

- (IBAction)sureBtnAction:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *setPassTextField;
@property (weak, nonatomic) IBOutlet UITextField *setPassTextFieldTwo;
- (IBAction)BackBtnAction:(id)sender;

@end
