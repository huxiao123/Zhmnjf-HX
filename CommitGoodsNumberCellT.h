//
//  CommitGoodsNumberCellT.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WarringMessageDelegate <NSObject>

- (void)sendWarringMessage:(NSString *)message;

@end

@interface CommitGoodsNumberCellT : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (nonatomic,assign)id<WarringMessageDelegate> messageDelegate;
@property (nonatomic,strong)NSMutableArray *dataArray;

- (IBAction)reduceButton:(id)sender;
- (IBAction)addButton:(id)sender;

@end
