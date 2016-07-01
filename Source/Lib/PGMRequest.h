//
//  PGMRequest.h
//  ProGolfMe
//
//  Created by Voropaev Vitali on 13.06.16.
//  Copyright © 2016 ProGolfMe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGMRequest : NSObject
@property (nonatomic, strong)   NSURLSessionDataTask    *task;

- (void)cancel;

@end
