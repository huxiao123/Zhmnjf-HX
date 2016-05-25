//
//  common.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 XY. All rights reserved.
//

#ifndef common_h
#define common_h

//隐藏导航栏
#define HiddenNavigationBar [self.navigationController setNavigationBarHidden:YES animated:YES]
//显示导航栏
#define ShowNavigationBar [self.navigationController setNavigationBarHidden:NO animated:YES]

#define windowColor  [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//屏幕尺寸
#define ScreeBounds ([UIScreen mainScreen].bounds)
//屏幕宽度
#define ScreeWidth ScreeBounds.size.width
//屏幕高度
#define ScreeHeight ScreeBounds.size.height
//隐藏滚动条
#define HiddenVerticalScrollIndicator self.BaseTableView.showsVerticalScrollIndicator = NO
//显示滚动条
#define ShowVerticalScrollIndicator self.BaseTableView.showsVerticalScrollIndicator = YES
//设置导航栏背景
#define SetNavigationBarBackgroundImage [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"矩形-2@2x"] forBarMetrics:UIBarMetricsDefault];

#define SetNavigationBarTintColor   [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

//订单image的placehold
#define OrderImagePlaceHold [UIImage imageNamed:@"组-2@2x"]
//主站URL
#define BaseUrl @"http://www.zhmnjf.com/"
#define BaseUrl2 @"http://www.zhmnjf.com/appapi/hdddapi.php?"

//--------defineNSString-----
#define Commission @"手续费: %ld元"
#define TheActualAmountToAccount  @"实际到账金额: %lf元"
#define LimitGetMoneyCount @"今日还剩%ld次免费提现次数"
#define BankCodeString @"尾号%ld储蓄卡"
#define BankCodeString2 @"尾号%@信用卡"
#define DataParsingError @"****数据解析错误*****"
#define currentPrice @"当前价格%@元"
#define doing        @"进行中"
#define finish       @"达成"
#define over         @"未达成"
#define activFinish @"活动达成,成交价%@"
#define activUnFinish @"活动未达成,活动结束"


#endif /* common_h */
