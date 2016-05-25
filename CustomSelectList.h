//
//  CustomSelectList.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^removeCustViewBlock)();
/*
 自定义凭证选择列表框
 */
@interface CustomSelectList : UIView<UITableViewDataSource,UITableViewDelegate>
{
    int sectionState[20];//标识分区的状态
}

@property (nonatomic,assign)CGRect rect;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIImageView *lineImage;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIButton *sureButton;
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)UILabel *headerLabel;
@property (nonatomic,strong)UILabel *buyAccountLabel;
@property (nonatomic,copy)removeCustViewBlock removeCustomViewBlock;


@end
