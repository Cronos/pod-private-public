//
//  PGMGolferRequest.h
//  ProGolfMe
//
//  Created by Voropaev Vitali on 23.06.16.
//  Copyright © 2016 ProGolfMe. All rights reserved.
//

#import "PGMRequest.h"

#import "PGMNetwork.h"

extern NSString * const kEmptyString;

typedef NS_ENUM(NSUInteger, PGMGolferRequestType) {
    PGMGolferRequestSignup = 0,
    PGMGolferRequestLogin,
    PGMGolferRequestGetInfo,
    PGMGolferRequestForgotPassword,
    PGMGolferRequestUpdate,
    PGMGolferRequestsCount
};

@interface PGMGolferRequest : PGMRequest

+ (instancetype)requestType:(PGMGolferRequestType)requestType
                    success:(PGMNetworkSuccess)success
                    failure:(PGMNetworkFailure)failure;;

+ (instancetype)requestType:(PGMGolferRequestType)requestType
                 parameters:(NSDictionary *)parameters
                    success:(PGMNetworkSuccess)success
                    failure:(PGMNetworkFailure)failure;

- (instancetype)initRequestType:(PGMGolferRequestType)requestType
                        success:(PGMNetworkSuccess)success
                        failure:(PGMNetworkFailure)failure;;

- (instancetype)initRequestType:(PGMGolferRequestType)requestType
                     parameters:(NSDictionary *)parameters
                        success:(PGMNetworkSuccess)success
                        failure:(PGMNetworkFailure)failure;

@end
