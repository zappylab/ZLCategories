//
// Created by Ilya Dyakonov on 17/12/13.
// Copyright (c) 2013 ZappyLab. All rights reserved.
//
//


#import "UIResponder+ZLCFirstResponder.h"

/////////////////////////////////////////////////////

static __weak id ZLC_currentFirstResponder;

@implementation UIResponder (ZLCFirstResponder)

+(id) zlc_currentFirstResponder
{
    ZLC_currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(ZLC_findFirstResponder:)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
    return ZLC_currentFirstResponder;
}

-(void) ZLC_findFirstResponder:(id) sender
{
    ZLC_currentFirstResponder = self;
}

@end

/////////////////////////////////////////////////////