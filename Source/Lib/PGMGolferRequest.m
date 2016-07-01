//
//  PGMGolferRequest.m
//  ProGolfMe
//
//  Created by Voropaev Vitali on 23.06.16.
//  Copyright © 2016 ProGolfMe. All rights reserved.
//

#import "PGMGolferRequest.h"
#import "PGMNetwork.h"

static NSString *const kPathForLogin            = @"https://api.progolfme.com/v1/token";
static NSString *const kPathForSignup           = @"https://api.progolfme.com/v1/signups";
static NSString *const kPathForGetInfo          = @"https://api.progolfme.com/v1/golfer";
static NSString *const kPathForForgotPassword   = @"https://api.progolfme.com/v1/passwords";
static NSString *const kPathForUpdate           = @"https://api.progolfme.com/v1/golfer";

static NSString *const kEmailKey                = @"email";
static NSString *const kPasswordKey             = @"password";
static NSString *const kFullNameKey             = @"full_name";
static NSString *const kLeftieKey               = @"leftie";
static NSString *const kHandicapKey             = @"handicap";
static NSString *const kCommonMishitsKey        = @"common_mishits";
static NSString *const kGoalsAndLimitationKey   = @"goals_and_limitations";

@interface PGMGolferRequest ()
@property (nonatomic, assign)   PGMGolferRequestType    requestType;
@property (nonatomic, readonly) NSString                *requestPath;
@property (nonatomic, readonly) NSDictionary            *requestParameters;

@end

@implementation PGMGolferRequest
@dynamic requestPath;
@dynamic requestParameters;

+ (instancetype)requestType:(PGMGolferRequestType)requestType
                    success:(PGMNetworkSuccess)success
                    failure:(PGMNetworkFailure)failure {
    return [[self alloc] initRequestType:requestType success:success failure:failure];
}

+ (instancetype)requestType:(PGMGolferRequestType)requestType
                 parameters:(NSDictionary *)parameters
                    success:(PGMNetworkSuccess)success
                    failure:(PGMNetworkFailure)failure {
    return [[self alloc] initRequestType:requestType parameters:(NSDictionary *)parameters success:success failure:failure];
}

- (instancetype)initRequestType:(PGMGolferRequestType)requestType
                        success:(PGMNetworkSuccess)success
                        failure:(PGMNetworkFailure)failure {
    return [self initRequestType:requestType parameters:self.requestParameters success:success failure:failure];
}

- (instancetype)initRequestType:(PGMGolferRequestType)requestType
                     parameters:(NSDictionary *)parameters
                        success:(PGMNetworkSuccess)success
                        failure:(PGMNetworkFailure)failure {
    self = [super init];
    self.requestType = requestType;
    NSDictionary *requestParameters = parameters ? parameters : self.requestParameters;
    if (PGMGolferRequestGetInfo == requestType) {
        self.task = [PGMNetwork GET:self.requestPath
                         parameters:requestParameters
                            success:success
                            failure:failure];
    } else if (PGMGolferRequestUpdate == requestType){
        self.task = [PGMNetwork PATCH:self.requestPath
                           parameters:requestParameters
                              success:success
                              failure:failure];
    } else {
        self.task = [PGMNetwork POST:self.requestPath
                          parameters:requestParameters
                             success:success
                             failure:failure];
    }
    
    return self;
}

- (NSString *)requestPath {
    switch (self.requestType) {
        case PGMGolferRequestLogin:
            return kPathForLogin;
            break;
        case PGMGolferRequestSignup:
            return kPathForSignup;
            break;
        case PGMGolferRequestForgotPassword:
            return kPathForForgotPassword;
            break;
        case PGMGolferRequestUpdate:
            return kPathForUpdate;
            break;
        default: // PGMGolferRequestGetInfo
            return kPathForGetInfo;
            break;
    }
}

@end
