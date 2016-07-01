//
//  PGMNetwork.h
//  ProGolfMe
//
//  Created by Voropaev Vitali on 10.06.16.
//  Copyright © 2016 ProGolfMe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PGMNetworkSuccess)(NSURLSessionDataTask *task, id responseObject);
typedef void(^PGMNetworkFailure)(NSURLSessionDataTask *task, NSError *error);

@class AFHTTPSessionManager;

@interface PGMNetwork : NSObject

+ (AFHTTPSessionManager *)networkManager;

+ (NSURLSessionDataTask *)GET:(NSString *)path
                   parameters:(NSDictionary *)parameters
                      success:(PGMNetworkSuccess)success
                      failure:(PGMNetworkFailure)failure;

+ (NSURLSessionDataTask *)POST:(NSString *)path
                    parameters:(NSDictionary *)parameters
                       success:(PGMNetworkSuccess)success
                       failure:(PGMNetworkFailure)failure;

+ (NSURLSessionDataTask *)PATCH:(NSString *)path
                    parameters:(NSDictionary *)parameters
                       success:(PGMNetworkSuccess)success
                       failure:(PGMNetworkFailure)failure;

@end
