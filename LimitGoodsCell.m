//
//  LimitGoodsCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "LimitGoodsCell.h"
#import "GoodsModel.h"
#import "GoodsDetailViewController.h"

@implementation LimitGoodsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell:(NSArray *)array{

    self.dataArraay = [NSMutableArray arrayWithArray:array];
    if (array.count>0) {
        
        GoodsModel *model = array[0];
        NSString *url = [NSString stringWithFormat:@"%@%@",BaseUrl,[model.pic_list substringFromIndex:2]];
        [self.image1 sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@""]];
        
        self.label1.text = model.sub_name;
        
        NSString *price_str1 = [NSString stringWithFormat:@"原价:%@元",model.price];
        self.label2.attributedText = [MyUnitility setNSStringColor:price_str1 withColor:[UIColor redColor] andRange:NSMakeRange(3, price_str1.length-4) ];
        
        NSString *newPrice_str1 = [NSString stringWithFormat:@"最终价:%@元",model.price];
        self.label3.attributedText = [MyUnitility setNSStringColor:newPrice_str1 withColor:[UIColor redColor] andRange:NSMakeRange(3, newPrice_str1.length-4) ];
    
        GoodsModel *model1 = array[1];
        NSString *url1 = [NSString stringWithFormat:@"%@%@",BaseUrl,[model1.pic_list substringFromIndex:2]];
        [self.image2 sd_setImageWithURL:[NSURL URLWithString:url1] placeholderImage:[UIImage imageNamed:@""]];
        
        self.label4.text = model1.sub_name;

        NSString *price_str2 = [NSString stringWithFormat:@"原价:%@元",model1.price];
        self.label5.attributedText = [MyUnitility setNSStringColor:price_str2 withColor:[UIColor redColor] andRange:NSMakeRange(3, price_str2.length-4) ];
        
        NSString *newPrice_str2 = [NSString stringWithFormat:@"最终价:%@元",model1.price];
        self.label6.attributedText = [MyUnitility setNSStringColor:newPrice_str2 withColor:[UIColor redColor] andRange:NSMakeRange(3, newPrice_str2.length-4) ];
        
        GoodsModel *model2 = array[2];
        NSString *url2 = [NSString stringWithFormat:@"%@%@",BaseUrl,[model2.pic_list substringFromIndex:2]];
        [self.image3 sd_setImageWithURL:[NSURL URLWithString:url2] placeholderImage:[UIImage imageNamed:@""]];
        
        self.label7.text = model2.sub_name;

        NSString *price_str3 = [NSString stringWithFormat:@"原价:%@元",model2.price];
        self.label8.attributedText = [MyUnitility setNSStringColor:price_str3 withColor:[UIColor redColor] andRange:NSMakeRange(3, price_str3.length-4) ];
        
        NSString *newPrice_str3 = [NSString stringWithFormat:@"最终价:%@元",model2.price];
        self.label9.attributedText = [MyUnitility setNSStringColor:newPrice_str3 withColor:[UIColor redColor] andRange:NSMakeRange(3, newPrice_str3.length-4) ];
        

        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
        self.image1.userInteractionEnabled = YES;
        [self.image1 addGestureRecognizer:tapGesture];
        
        UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture2)];
        self.image2.userInteractionEnabled = YES;
        [self.image2 addGestureRecognizer:tapGesture2];
        
        UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture3)];
        self.image3.userInteractionEnabled = YES;
        
        [self.image3 addGestureRecognizer:tapGesture3];
        
    }
    
  
}

- (void)tapGesture{
    GoodsModel *model = self.dataArraay[0];
    GoodsDetailViewController *control = [[GoodsDetailViewController alloc]init];
    control.goodsId = model.goodsId;
    [self.viewController.navigationController pushViewController:control animated:YES];
}

- (void)tapGesture2{
    GoodsModel *model = self.dataArraay[1];
    GoodsDetailViewController *control = [[GoodsDetailViewController alloc]init];
    control.goodsId = model.goodsId;
    [self.viewController.navigationController pushViewController:control animated:YES];
}

- (void)tapGesture3{
    GoodsModel *model = self.dataArraay[2];
    GoodsDetailViewController *control = [[GoodsDetailViewController alloc]init];
    control.goodsId = model.goodsId;
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
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
