//
// Created by Ilya Dyakonov on 04/03/14.
// Copyright (c) 2014 ZappyLab. All rights reserved.
//
//


#import <Foundation/Foundation.h>

/////////////////////////////////////////////////////

@interface NSObject (ZLCNonOverriddenMethodException)

-(void) ZLC_throwNonOverriddenMethodExceptionWithReason:(NSString *) reason;

@end

/////////////////////////////////////////////////////
