//
//  PGMNetwork.m
//  ProGolfMe
//
//  Created by Voropaev Vitali on 10.06.16.
//  Copyright © 2016 ProGolfMe. All rights reserved.
//

#import "PGMNetwork.h"

#import <AFNetworking/AFNetworking.h>

static NSString * const kNetworkHeaderUserEmail = @"X-User-Email";
static NSString * const kNetworkHeaderUserToken = @"X-User-Token";

@implementation PGMNetwork

+ (AFHTTPSessionManager *)networkManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy = policy;
    
    [self setupJSONManager:manager];
    
    return manager;
}

+ (void)setupJSONManager:(AFHTTPSessionManager *)manager {
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    manager.requestSerializer = requestSerializer;
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                         @"application/json",
                                                         @"application/jsonrequest",
                                                         nil];
}

+ (NSURLSessionDataTask *)GET:(NSString *)path
                   parameters:(NSDictionary *)parameters
                      success:(PGMNetworkSuccess)success
                      failure:(PGMNetworkFailure)failure
{
    return [[self networkManager] GET:path parameters:parameters progress:nil success:success failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)path
                    parameters:(NSDictionary *)parameters
                       success:(PGMNetworkSuccess)success
                       failure:(PGMNetworkFailure)failure
{
    return [[self networkManager] POST:path parameters:parameters progress:nil success:success failure:failure];
}

+ (NSURLSessionDataTask *)PATCH:(NSString *)path
                     parameters:(NSDictionary *)parameters
                        success:(PGMNetworkSuccess)success
                        failure:(PGMNetworkFailure)failure
{
    return [[self networkManager] PATCH:path parameters:parameters success:success failure:failure];
}

@end
