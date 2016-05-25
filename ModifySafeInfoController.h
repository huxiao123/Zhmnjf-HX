//
//  ModifySafeInfoController.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ModifySafeInfoType){
    PasswordType,
    EmailType,
    RegisterType
} ;

@interface ModifySafeInfoController : UIViewController

@property (nonatomic,assign)ModifySafeInfoType modifyType;

@end

