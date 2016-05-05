//
//  NSObject+Network.m
//  picViewer
//
//  Created by 彭益伟 on 5/5/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "NSObject+Network.h"

@implementation NSObject (Network)

+ (AFHTTPSessionManager *)sharedAFManager{
    static AFHTTPSessionManager *manager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval=30;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",@"text/plain", nil];
//        [manager.requestSerializer setValue:nil forHTTPHeaderField:nil];
    });
    return manager;
}


+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    return [[self sharedAFManager] GET:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        completionHandle(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    return [[self sharedAFManager] POST:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        completionHandle(nil, error);
    }];
}

@end














