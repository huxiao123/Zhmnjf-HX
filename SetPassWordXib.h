//
//  SetPassWordXib.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "loginXib.h"
#import "SetPassWordNextXib.h"

@interface SetPassWordXib : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *EnterPhoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *EnterCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *GetCodeBtnAction;

- (IBAction)NextBtnAction:(id)sender;
- (IBAction)BackBtnAction:(id)sender;

@end
