//
//  NumberSelectList.m
//  Zhmnjf-HX
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "NumberSelectList.h"

@implementation NumberSelectList
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.backgroundColor = [UIColor colorWithWhite:0.5f alpha:0.5];
        [self tableView];
        
    }
    return self;
}

- (UITableView *)tableView{
    if (!_tableView) {

        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, (ScreeHeight-64)/3*2,ScreeWidth ,ScreeHeight/3)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.layoutMargins = UIEdgeInsetsZero;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 50;
        [self addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
    }
    return _dataSource;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (ScreeHeight-64)/3/3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.textLabel.text = @"11111";
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.detailTextLabel.text = @"22222";
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    cell.imageView.image = [UIImage imageNamed:@"clock-"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.listDelegate respondsToSelector:@selector(NumberSelectList)]) {
        [self.listDelegate NumberSelectList];
    }else
        NSLog(@"listDelegate为nil");
}
@end
