//
// Created by Ilya Dyakonov on 04/03/14.
// Copyright (c) 2014 ZappyLab. All rights reserved.
//
//


#import "NSObject+ZLCNonOverriddenMethodException.h"

/////////////////////////////////////////////////////

@implementation NSObject (ZLCNonOverriddenMethodException)

-(void) ZLC_throwNonOverriddenMethodExceptionWithReason:(NSString *) reason
{
    @throw [NSException exceptionWithName:@"NonOverriddenMethodException"
                                   reason:reason
                                 userInfo:nil];
}

@end

/////////////////////////////////////////////////////