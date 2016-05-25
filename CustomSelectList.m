//
//  CustomSelectList.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "CustomSelectList.h"
#import "CustomSelectListCell.h"

#define FoldImageName @"arrow_fold"
#define SpreadImageName @"arrow_spread"

@implementation CustomSelectList

//+ (CustomSelectList *)shareCustomSelectList{
//    static CustomSelectList *message;
//    static dispatch_once_t once;
//    dispatch_once(&once, ^{
//        if (!message) {
//            message = [[CustomSelectList alloc]init];
//        }
//    });
//                 
//    return message;
//}

//562 540
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 15;
        [self addSubview:self.titleLabel];
        [self addSubview:self.tableView];
        [self addSubview:self.lineImage];
        [self addSubview:self.sureButton];
    }
    return self;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.frame.size.width-15*2, 50)];
        _titleLabel.text = @"我的抢购凭证";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(15, 50, self.frame.size.width-15*2, self.frame.size.height-50-45) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)lineImage{
    if (!_lineImage) {
        _lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-46, self.frame.size.width, 1)];
        _lineImage.image  = [UIImage imageNamed:@"横分割线-拷贝@2x"];
    }
    return _lineImage;
}

- (UIButton *)sureButton{
    if (!_sureButton) {
        _sureButton = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2-40, self.frame.size.height-45, 80, 45)];
        [_sureButton setTitle:@"关闭" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor colorWithRed:69/255.0f green:143/255.0f blue:248/255.0f alpha:1] forState:UIControlStateNormal];
        [_sureButton addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _sureButton;
}

#pragma mark  -----UITableViewDelegate -----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return self.dataSource.count;
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return [self.dataSource[section] count];
    
    //设置返回几行
    if (!sectionState[section]) {
        return 0;
    }
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"CustomSelectcellId";
    CustomSelectListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"CustomSelectListCell" owner:self options:nil].lastObject;
    }
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectZero];
    headerView.backgroundColor=[UIColor whiteColor];//浅灰色
    
    self.headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(10+25+5, (40-25-1)/2, 150, 25)];
    self.headerLabel.font = [UIFont systemFontOfSize:11];
    self.headerLabel.text = @"2015-10-11 13:00:00";
    [headerView addSubview:self.headerLabel];
    
    self.buyAccountLabel = [[UILabel alloc]initWithFrame:CGRectMake(10+25+5+100+30, (40-25-1)/2, ScreeWidth-10-25-5-100-30, 25)];
    self.buyAccountLabel.font = [UIFont systemFontOfSize:11];
    self.buyAccountLabel.text = @"购买3份";
    [headerView addSubview:self.buyAccountLabel];
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"横分割线-拷贝@2x"]];
    lineImageView.frame =CGRectMake(0, 39, self.frame.size.width, 1);
    [headerView addSubview:lineImageView];
    
    //加载图片
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, (40-25-1)/2, 25, 25)];
    if (sectionState[section]) {//收起状态
        imageView.image=[UIImage imageNamed:FoldImageName];
    }
    else{
        imageView.image=[UIImage imageNamed:SpreadImageName];
    }
    
    [headerView addSubview:imageView];
    
    //添加点击手势
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    
    headerView.userInteractionEnabled=YES;
    
    tap.numberOfTapsRequired=1;
    
    tap.numberOfTouchesRequired=1;
    
    //设置tag的值
    headerView.tag=section;
    
    [headerView addGestureRecognizer:tap];
    
    return headerView;
}

//实现点击时间
-(void)tapClick:(UITapGestureRecognizer *)tap
{
    NSLog(@"---");
    
    NSInteger index=tap.view.tag;//获取当前点击section 的tag值
    NSLog(@"--%li",index);
    
    sectionState[index]^=1;
    //收起
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationFade];//动态加载哪个分区,所以要传入具体的分区
    
}

- (void)removeView{
    if (self.removeCustomViewBlock) {
        
        self.removeCustomViewBlock();
        [self removeFromSuperview];
        
    }
   
}
@end
