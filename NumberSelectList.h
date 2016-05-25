//
//  NumberSelectList.h
//  Zhmnjf-HX
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol NumberSelectListDelegate <NSObject>

- (void)NumberSelectList;

@end
@interface NumberSelectList : UIView<UITableViewDataSource,UITableViewDelegate>

/*
 期数选择列表
 */
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,assign)id<NumberSelectListDelegate> listDelegate;

@end
