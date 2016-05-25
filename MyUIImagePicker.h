//
//  MyUIImagePicker.h
//  Zhmnjf-HX
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface MyUIImagePicker : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong)UIImagePickerController *picker;

@end
