//
//  AFHttpRequest.h
//  Zhmnjf-HX
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 XY. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void (^success)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);
typedef void (^failure)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error);

@interface XHHttpRequest : NSObject


+ (XHHttpRequest *_Nonnull)shareAFHttpRequest;

- (void)netWorkMonitor;

- (void)afHttpPostRequest:(NSString * _Nonnull)url WithDic:(NSDictionary *_Nonnull)param WithSuccess:(_Nonnull success)sucBlock WithFailure:(_Nonnull failure) failBlock;

- (void)afHttpGetRequest:(NSString * _Nonnull)url WithDic:(NSDictionary *_Nonnull)param WithSuccess:(_Nonnull success)sucBlock WithFailure:(_Nonnull failure) failBlock;
@end
