//
//  AFHttpRequest.m
//  Zhmnjf-HX
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "XHHttpRequest.h"



@implementation XHHttpRequest

+ (XHHttpRequest *)shareAFHttpRequest{
    
    static XHHttpRequest *afHttpRequest = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        if (afHttpRequest==nil) {
            afHttpRequest = [[XHHttpRequest alloc]init];

        }
    });
    return afHttpRequest;
}

#pragma mark - 监控网络
- (void)netWorkMonitor
{

    /*
     通过AFNetworkReachabilityManager 可以用来检测网络状态的变化 */
    AFNetworkReachabilityManager *reachManager = [AFNetworkReachabilityManager sharedManager];
    [reachManager startMonitoring];
    [reachManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"网络状态"
                                                                    message:@"网络异常"
                                                                   delegate:nil
                                                          cancelButtonTitle:@"确定"
                                                          otherButtonTitles:nil];
                [alertView show];
                break;
            }
            case AFNetworkReachabilityStatusNotReachable: {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"网络状态"
                                                                    message:@"网络未连接"
                                                                   delegate:nil
                                                          cancelButtonTitle:@"确定"
                                                          otherButtonTitles:nil];
                [alertView show];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN: {
//                self.title = @"WWAN连接";
                
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: {
//                self.title = @"WIFI连接";
                break;
            }
            default: {
                break;
            }
        }
    }];
    
}

//post请求
- (void)afHttpPostRequest:(NSString * _Nonnull)url WithDic:(NSDictionary *_Nonnull)param WithSuccess:(_Nonnull success)sucBlock WithFailure:(_Nonnull failure) failBlock{
    
    AFHTTPSessionManager *manager  = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/json"];
    
    [manager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        sucBlock(task,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failBlock(task,error);
    }];
    

}

- (void)afHttpGetRequest:(NSString * _Nonnull)url WithDic:(NSDictionary *_Nonnull)param WithSuccess:(_Nonnull success)sucBlock WithFailure:(_Nonnull failure) failBlock{
    
    AFHTTPSessionManager *manager  = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/json"];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
          sucBlock(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failBlock(task,error);
    }];
    
    
}


@end
