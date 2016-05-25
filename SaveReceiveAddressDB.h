//
//  SaveReceiveAddressDB.h
//  Zhmnjf-HX
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveReceiveAddressDB : NSObject

+(SaveReceiveAddressDB *)shareManager;
-(BOOL )insertModel:(NSArray *)addressArray;
-(void)deleteDataWith:(NSNumber *)dataID;
//ID1 值=1的defualtFlag ID2 值=0....
-(void)updateWith:(NSString *)Id1 andValue:(NSString * )value;
-(NSArray *)selectAllData;
- (void)deleteDatas;
-(BOOL)isOrNotIN:(NSNumber *)idOne;
- (BOOL)updateWith:(NSArray *)array;
@end
