//
//  RegisterXib.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "loginXib.h"

@interface RegisterXib : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *enterUserName;
@property (weak, nonatomic) IBOutlet UITextField *enterPass;
@property (weak, nonatomic) IBOutlet UITextField *enterPassTwo;
@property (weak, nonatomic) IBOutlet UITextField *enterCode;
@property (weak, nonatomic) IBOutlet UITextField *enterPhone;

- (IBAction)getCodeBtn:(id)sender;
- (IBAction)sureBtnAction:(id)sender;
- (IBAction)BackBtnAction:(id)sender;

@end
