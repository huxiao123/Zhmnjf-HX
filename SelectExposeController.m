//
//  SelectExposeController.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "SelectExposeController.h"
#import "OnlyEnterTextFileCell.h"
#import "EnterTextViewContentCell.h"
#import "AddExposePhotoCell.h"
#import "PhotoCollectionCell.h"
#import "ZYQAssetPickerController.h"
#import "NumberSelectList.h"
#import <MobileCoreServices/MobileCoreServices.h>

 static  NSString *photoCollectionCellId = @"photoCollectionCellId";

@interface SelectExposeController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ZYQAssetPickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,NumberSelectListDelegate>
{
   CGFloat _imgHeight;
    UILabel *_textViewLabel;
}

@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *collectionDataSource;
@property (nonatomic,strong)UILongPressGestureRecognizer *longPress;
@property (nonatomic,strong)ZYQAssetPickerController *picker;//照片多选
@property (nonatomic,strong)UIImagePickerController *imagePicker;
@property (nonatomic,strong)UIAlertController *actionSheet;
@property (nonatomic,strong)NumberSelectList *list;
@property (nonatomic,strong)UIView *CoverView;
@property (nonatomic,strong)UIButton *deleteBtn;

@end

@implementation SelectExposeController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    SetNavigationBarBackgroundImage;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    HiddenNavigationBar;
    [self.tabBarController.tabBar setHidden:NO];;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    
  
}

- (UIAlertController *)actionSheet{
    if (!_actionSheet) {
        _actionSheet = [UIAlertController alertControllerWithTitle:nil message:@"请选择你要分享的照片" preferredStyle:0];
        
        [_actionSheet addAction:[UIAlertAction actionWithTitle:@"本地相册" style:0 handler:^(UIAlertAction * _Nonnull action) {
            
            if (self.collectionDataSource.count>=9) {
                [MyUnitility configAlertView:self
                                     contont:@"最多可以添加9张图片"
                                    title:@"提示"
                                     buttonTitle:@"我知道了"];
            }else
            [self picker];
            
        }]];
        [_actionSheet addAction:[UIAlertAction actionWithTitle:@"照相机" style:0 handler:^(UIAlertAction * _Nonnull action) {
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    if (self.collectionDataSource.count>=9) {
                        [MyUnitility configAlertView:self
                                             contont:@"最多可以添加9张图片"
                                            title:@"提示"
                                            buttonTitle:@"我知道了"];
                    }else{
                        [self usersPickerType:UIImagePickerControllerSourceTypeCamera];

                    }
            }else{
                [MyUnitility configAlertView:self
                                     contont:@"相机不可用"
                                     title:@"提示"
                                     buttonTitle:@"我知道了"];
            }
        }]];
        [_actionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:1 handler:nil]];
        
    }
    [self presentViewController:_actionSheet animated:YES completion:nil];
    return _actionSheet;
}

- (ZYQAssetPickerController *)picker{
    if (!_picker) {
        _picker = [[ZYQAssetPickerController alloc] init];
        _picker.maximumNumberOfSelection = 9;
        _picker.assetsFilter = [ALAssetsFilter allPhotos];
        _picker.showEmptyGroups=NO;
        _picker.delegate=self;
        _picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
                NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
                return duration >= 5;
            } else {
                return YES;
            }
        }];
    }
    [self presentViewController:_picker animated:YES completion:NULL];
    return _picker;
}

#pragma mark -----UITableViewDelegate--------

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.01;
}


- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }else
        return 1;
}

/**
 @param: 参数 13  图片高度比宽度多出13dp
 @param: 参数 8 图片距离cell顶部8dp
 @param: 参数 5 size顶部边距
 @param: 参数 5 cell边距
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 44;
            
        }else if (indexPath.row==1){
            return 48;
            
        }else if (indexPath.row==2){
            return 145;
        }
    }else if (indexPath.section==1){
        
        if (self.collectionDataSource.count>6) {
            return 10*2+5*2+((self.view.frame.size.width-50)/3)*3+(13+8)*3;

        }else if (self.collectionDataSource.count>3&&
                  self.collectionDataSource.count<7){
    
             return 10*2+5+((self.view.frame.size.width-50)/3)*2+(13+8)*2;
        
        }else if (self.collectionDataSource.count>0&&
                  self.collectionDataSource.count<4){
            
             return 10*2+((self.view.frame.size.width-50)/3)*1+(13+8)*1;
            
        }else if(self.collectionDataSource.count==0){
           
            return 0;
        }
        
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    static NSString *OnlyEnterCellId = @"OnlyEnterCellId";
    static NSString *EnterTextViewCellId = @"EnterTextViewCellId";
   
    
    UITableViewCell *locaCell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
            {
                if (!locaCell) {
                    locaCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
                }
                locaCell.backgroundColor = [UIColor whiteColor];
                locaCell.imageView.image = [UIImage imageNamed:@"产品图@2x"];
                locaCell.textLabel.text = @"(00000001期)苹果5";
                locaCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return locaCell;
            }
                break;
            case 1:
            {
                OnlyEnterTextFileCell *onlyCell = [tableView dequeueReusableCellWithIdentifier:OnlyEnterCellId];
                if (!onlyCell) {
                     onlyCell = [[NSBundle mainBundle]loadNibNamed:@"OnlyEnterTextFileCell" owner:self options:nil].lastObject;
                }
               
                return onlyCell;
            }
                break;
            case 2:
            {
                EnterTextViewContentCell *enterCell = [tableView dequeueReusableCellWithIdentifier:EnterTextViewCellId];
                if (!enterCell) {
                     enterCell = [[NSBundle mainBundle]loadNibNamed:@"EnterTextViewContentCell" owner:self options:nil].lastObject;
                }
                enterCell.textView.delegate = self;
                _textViewLabel = enterCell.descLabel;
                [enterCell.addImageBtn addTarget:self action:@selector(configActionSheet) forControlEvents:UIControlEventTouchUpInside];
                return enterCell;

            }
                break;

            default:
                break;
        }
        
    }else{
        
        if (!locaCell) {
            locaCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        for (UIView *view in locaCell.subviews) {
            [view removeFromSuperview];
        }
        locaCell.backgroundColor = [UIColor clearColor];
        [locaCell addSubview:self.collectionView];
        return locaCell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0 &&
        indexPath.row==0) {
          [self list];
    }
  
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreeWidth, 100)];
        view.backgroundColor = [UIColor clearColor];
        view.userInteractionEnabled = YES;
        
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        saveBtn.frame = CGRectMake(30, 10, ScreeWidth-60, 45);
        [saveBtn setTitle:@"确认" forState:UIControlStateNormal];
        [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [saveBtn setBackgroundImage:[UIImage imageNamed:@"确认@2x"] forState:UIControlStateNormal];
        [saveBtn addTarget:self action:@selector(sureBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:saveBtn];
        return view;
        
    }
    return nil;
    
}

#pragma mark ----UIColletionView------
- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((self.view.frame.size.width-50)/3, (self.view.frame.size.width-50)/3+13+8);
        layout.minimumInteritemSpacing = 2.5;
        layout.minimumLineSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
        
        _imgHeight = (self.view.frame.size.width - 50)/3;
        CGFloat collectHeight = 10*2+5*2+((self.view.frame.size.width-50)/3)*3+13*3;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,collectHeight)  collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        
       [_collectionView registerNib:[UINib nibWithNibName:@"PhotoCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:photoCollectionCellId];
        
        [_collectionView addGestureRecognizer:self.longPress];

    }
    return _collectionView;
}

- (UILongPressGestureRecognizer *)longPress{
    
    if (!_longPress) {
        //设置长按手势 长按手势有几种状态,默认不判断手势状态的话会执行两次, 分别是UIGestureRecognizerStateBegan和UIGestureRecognizerStateEnded
        _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
        _longPress.minimumPressDuration = 1.0;
    }
    return _longPress;
}

- (void)longPressGesture:(UILongPressGestureRecognizer *)longGesture{
    
    if (longGesture.state == UIGestureRecognizerStateBegan) {
        CGPoint pointTouch = [longGesture locationInView:self.collectionView];
        NSIndexPath *path = [self.collectionView indexPathForItemAtPoint:pointTouch];
        PhotoCollectionCell *cell = (PhotoCollectionCell *)[self.collectionView cellForItemAtIndexPath:path];
        [self addCoverAndDeleteBtn:cell andPath:path];

    }
    
}

- (NSMutableArray *)collectionDataSource
{
    if (!_collectionDataSource) {
             _collectionDataSource = [NSMutableArray array];
    }
   return  _collectionDataSource;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collectionDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:photoCollectionCellId forIndexPath:indexPath];
    if (self.collectionDataSource.count>0) {
        [cell configCell:self.collectionDataSource[indexPath.item]];
    }
    return cell;
}


- (UIView *)CoverView{
    if (!_CoverView) {
        _CoverView = [[UIView alloc]init];
        _CoverView.backgroundColor = [UIColor blackColor];
        _CoverView.alpha = 0.5;
    }
    return _CoverView;
}

- (UIButton *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBtn.frame = CGRectMake(0, 0, 18, 18);
        [_deleteBtn setBackgroundImage:[UIImage imageNamed:@"晒单删除@2x"] forState:UIControlStateNormal];
        [_deleteBtn addTarget:self action:@selector(deleteImageAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteBtn;
}

//添加遮罩效果和删除按钮
- (PhotoCollectionCell *)addCoverAndDeleteBtn:(PhotoCollectionCell *)cell andPath:(NSIndexPath *)path{
    
    CGRect rect = cell.bounds;
    CGFloat point = rect.origin.y + 8;
    rect.origin.y = point;
    
    self.CoverView.frame = rect;
    [cell.contentView addSubview:self.CoverView];
    
    self.deleteBtn.tag = path.item;
    [cell.contentView addSubview:self.deleteBtn];
    

    return cell;
}

#pragma mark   ---NumberSelectList----
- (NumberSelectList *)list{
    if (!_list) {
        _list = [[NumberSelectList alloc]initWithFrame:self.view.bounds];
        _list.listDelegate = self;
    }
    [self.view addSubview:_list];
    return _list;
}

- (void)NumberSelectList{
    NSLog(@"回传数据");
    [_list removeFromSuperview];
}

#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{

        for (int i=0; i<assets.count; i++) {
            ALAsset *asset=assets[i];
            UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
            if (self.collectionDataSource.count<10) {
                  [self.collectionDataSource addObject:tempImg];
            }
        }
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:1];
        [self.collectionView reloadData];
        [self.BaseTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:5];

}

#pragma mark ----UIImagePickerController----

- (UIImagePickerController *)imagePicker{
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
        _imagePicker.allowsEditing = YES;
       
        
    }
    return _imagePicker;
}

#pragma mark ---pricker---
- (void)usersPickerType:(UIImagePickerControllerSourceType)type{
    [self imagePicker];
    _imagePicker.sourceType = type;
    
    [self presentViewController:_imagePicker animated:YES completion:^{
        NSLog(@"跳转成功！");
    }];
  
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //选中的如果是一张图片
    if ([type isEqualToString:(NSString *)kUTTypeImage]) {
      
        UIImage *viewImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (self.collectionDataSource.count<10) {
            [self.collectionDataSource addObject:viewImage];
            
            [self.collectionView reloadData];
            NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:1];
            [self.BaseTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:5];
        }
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark ----UITextViewDelegate---
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


- (void)textViewDidChangeSelection:(UITextView *)textView{

    if ([textView.text isEqualToString:@""]) {
        _textViewLabel.hidden = NO;
        
    }else
          _textViewLabel.hidden = YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
  
    NSLog(@"textView");
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length<20) {
        [MyUnitility configAlertView:self contont:@"输入内容不能少于20个字" title:@"提示" buttonTitle:@"继续输入"];
        [textView becomeFirstResponder];
    }
}

#pragma mark -----BtnAction-----

- (void)deleteImageAction:(UIButton *)btn{
  
    [self.CoverView removeFromSuperview];
    [self.deleteBtn removeFromSuperview];
    [self.collectionDataSource removeObjectAtIndex:btn.tag];
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:1];
    [self.collectionView reloadData];
    [self.BaseTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:5];
    
  
}

- (void)sureBtnAction{
    [MyUnitility configAlertView:self contont:@"即将发送晒单请求" title:@"提示" buttonTitle:@"我知道了"];
}

- (void)configActionSheet{
    [self actionSheet];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.list removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
