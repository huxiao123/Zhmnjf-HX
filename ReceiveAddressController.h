//
//  ReceiveAddressEditView.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "BaseViewController.h"

/*
 编辑收获地址
 */

typedef  NS_ENUM(NSInteger,WhoPushReceiveAddressCtrol){
    CommitOrderControllerPush,
    ShowReceiveAddressControllerPush
    
};

@interface ReceiveAddressController : BaseViewController

//修改的是数据库那个地址
@property (nonatomic,copy)NSString *addId;
@property (nonatomic,assign)WhoPushReceiveAddressCtrol pushCtorl;
@property (nonatomic,assign)BOOL isUpadate;

@end
