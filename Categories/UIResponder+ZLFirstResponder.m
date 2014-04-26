//
// Created by Ilya Dyakonov on 17/12/13.
// Copyright (c) 2013 ZappyLab. All rights reserved.
//
//


#import "UIResponder+FirstResponder.h"

/////////////////////////////////////////////////////

static __weak id ZL_currentFirstResponder;

@implementation UIResponder (ZLFirstResponder)

+(id) ZL_currentFirstResponder
{
    ZL_currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
    return ZL_currentFirstResponder;
}

-(void) findFirstResponder:(id) sender
{
    ZL_currentFirstResponder = self;
}

@end

/////////////////////////////////////////////////////