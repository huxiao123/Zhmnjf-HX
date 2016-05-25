//
//  CommitGoodsNumberCellT.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "CommitGoodsNumberCellT.h"
#import "GoodsDetailModels.h"

@implementation CommitGoodsNumberCellT

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)reduceButton:(id)sender {
    if (self.textField.text.intValue>0) {
        self.textField.text = [NSString stringWithFormat:@"%d",self.textField.text.intValue-1];
        
    }else{
        if ([self.messageDelegate respondsToSelector:@selector(sendWarringMessage:)]) {
            [self.messageDelegate sendWarringMessage:@"不能再少了"];
        }
    }
}

- (IBAction)addButton:(id)sender {
    GoodsDetailModels *model = self.dataArray.firstObject;
    if ((self.textField.text.intValue+1)<=model.sum.intValue) {
         self.textField.text = [NSString stringWithFormat:@"%d",self.textField.text.intValue+1];
        
    }else{
        if ([self.messageDelegate respondsToSelector:@selector(sendWarringMessage:)]) {
            [self.messageDelegate sendWarringMessage:@"没有更多了"];
        }
    }
   
}
@end
