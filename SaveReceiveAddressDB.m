//
//  SaveReceiveAddressDB.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "SaveReceiveAddressDB.h"

@implementation SaveReceiveAddressDB
{
    FMDatabase *_fmdb;
    NSLock *_lock;
}
+(SaveReceiveAddressDB *)shareManager{
    static SaveReceiveAddressDB *manager=nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (manager==nil) {
            manager=[[SaveReceiveAddressDB alloc]init];
        }
    });
    return manager;
}

-(id)init{
    self=[super init];
    if (self) {
        
        _lock=[[NSLock alloc]init];
        
        //        [_lock lock];  加锁
        //        [_lock unlock];  解锁
        
        NSString *path=[NSHomeDirectory() stringByAppendingString:@"/Documents/zhmnjf.db"];
        _fmdb=[[FMDatabase alloc]initWithPath:path];
        if ([_fmdb open]) {
            NSString *createSql=@"create table if not exists SaveReceiveAddressDB(id integer primary key autoincrement,name varchar(15),phone integer(11),address varchar(250),defaltFlag integer(5),code varchar(20))";
            BOOL success=[_fmdb executeUpdate:createSql];
            if (!success) {
                NSLog(@"create:%@",_fmdb.lastError);
            }
        }
    }
    return self;
}

// 插入数据
-(BOOL )insertModel:(NSArray *)addressArray{
   
    NSString *insertSql=@"insert into SaveReceiveAddressDB(name,phone,address,defaltFlag,code) values(?,?,?,?,?)";
   
//    UIImage *image=model.headImage;
//    NSData *data=UIImagePNGRepresentation(image);//UIImagePNGRepresentation 这个方法是可以将png类型的图片转化成 NSData
    BOOL success=[_fmdb executeUpdate:insertSql,addressArray.firstObject,addressArray[1],addressArray[2],addressArray[3],addressArray.lastObject];//executeUpdate 后面需要去接 继承与NSObject类所实例化的对象 否则会抛出EXC_BAD_ACCESS错误
    if (!success) {
        NSLog(@"%@",_fmdb.lastError);
        return NO;
    }
    NSLog(@"%@",addressArray[3]);
    return YES;
}

//删除数据
-(void)deleteDataWith:(NSNumber *)dataID{
    [_lock lock];
    NSString *deleteSql=@"delete from SaveReceiveAddressDB where id=?";// delete from 表名 where 属性＝?
    BOOL success=[_fmdb executeUpdate:deleteSql,dataID];
    if (!success) {
        NSLog(@"%@",_fmdb.lastError);
    }
    [_lock unlock];
}

- (void)deleteDatas{
    [_lock lock];
    NSString *deleteSql=@"delete from SaveReceiveAddressDB";// delete from 表名 where 属性＝?
    BOOL success=[_fmdb executeUpdate:deleteSql];
    if (!success) {
        NSLog(@"%@",_fmdb.lastError);
    }
    [_lock unlock];
}

- (BOOL)updateWith:(NSArray *)array{
    [_lock lock];
    NSString *updateSql = @"update SaveReceiveAddressDB set name=?,phone=?,address=?,defaltFlag=?,code=? where id=?";
   BOOL set = [_fmdb executeUpdate:updateSql,array[0],array[1],array[2],array[3],array[4],array[5]];
    if (!set) {
        NSLog(@"更新失败");
    }
    [_lock unlock];
    return set;
}

-(void)updateWith:(NSString *)Id1 andValue:(NSString * )value{
    [_lock lock];
    NSString *updateSql=@"update SaveReceiveAddressDB set defaltFlag=? where id=?";// update 表名 set 属性名＝？,属性名＝？ where 属性名＝？
    BOOL ret =[_fmdb executeUpdate:updateSql,@"0",Id1];
    NSLog(@"%@",Id1);
    if (!ret) {
        NSLog(@"更新失败");
    }
    [_lock unlock];
}

-(NSArray *)selectAllData{
    [_lock lock];
    NSString *selSQL=@"select * from SaveReceiveAddressDB";//* 查找全部 select * from 表名
    FMResultSet *set=[_fmdb executeQuery:selSQL];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    while ([set next]) {
       NSMutableArray *setArray=[[NSMutableArray alloc]init];
        [setArray addObject:[set stringForColumn:@"name"]];
        [setArray addObject:[set stringForColumn:@"phone"]];
        [setArray addObject:[set stringForColumn:@"address"]];
        [setArray addObject:[set stringForColumn:@"defaltFlag"]];
        [setArray addObject:[set stringForColumn:@"id"]];
        [setArray addObject:[set stringForColumn:@"code"]];
        [array addObject:setArray];
    }

    [_lock unlock];
    return [array copy];
}
// 查找一条语句是否存在
-(BOOL)isOrNotIN:(NSNumber *)idOne{
    NSString *sql=@"select * from SaveReceiveAddressDB where id=?";//
    FMResultSet *set=[_fmdb executeQuery:sql];
    return [set next];
}

@end
