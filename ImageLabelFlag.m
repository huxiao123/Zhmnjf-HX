//
//  ImageLabelFlag.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ImageLabelFlag.h"
#import "CollectionViewController.h"

@implementation ImageLabelFlag

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)AllGoodsBtn:(id)sender {
    CollectionViewController *control = [[CollectionViewController alloc]init];
    [self.viewController.navigationController pushViewController:control animated:YES];

}

- (UIViewController *)viewController
{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        
        next = [next nextResponder];
        
    } while (next != nil);
    
    
    return nil;
}
@end
