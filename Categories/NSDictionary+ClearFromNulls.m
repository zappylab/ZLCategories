//
// Created by Ilya Dyakonov on 11/02/14.
// Copyright (c) 2014 ZappyLab. All rights reserved.
//
//


#import "NSDictionary+ZLClearFromNulls.h"

/////////////////////////////////////////////////////

@implementation NSDictionary (ZLClearFromNulls)

-(NSDictionary *) zlc_clearFromNulls
{
    NSMutableDictionary *mutableDictionary = [self mutableCopy];
    for (id key in mutableDictionary.allKeys) {
        id object = [mutableDictionary objectForKey:key];
        if ([object isKindOfClass:[NSNull class]]) {
            [mutableDictionary removeObjectForKey:key];
        }
    }

    return [NSDictionary dictionaryWithDictionary:mutableDictionary];
}

@end

/////////////////////////////////////////////////////