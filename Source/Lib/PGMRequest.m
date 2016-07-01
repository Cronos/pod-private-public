//
//  PGMRequest.m
//  ProGolfMe
//
//  Created by Voropaev Vitali on 13.06.16.
//  Copyright © 2016 ProGolfMe. All rights reserved.
//

#import "PGMRequest.h"

@implementation PGMRequest

- (void)cancel {
    [self.task cancel];
}

@end
