//
//  GoodTopViewCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "GoodTopViewCell.h"
#import "GoodsDetailModels.h"

@implementation GoodTopViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)backBtn:(id)sender {
    [self.viewController.navigationController popViewControllerAnimated:YES];
}

- (void)configCellImage:(NSArray *)arry{
    GoodsDetailModels *model = arry.firstObject;

    NSString *url = [NSString stringWithFormat:@"%@%@",BaseUrl,[model.pic_index substringFromIndex:1]];
    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"bannner@2x" ]];
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
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
