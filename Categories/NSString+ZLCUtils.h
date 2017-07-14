//
// Created by Ilya Dyakonov on 11/09/14.
// Copyright (c) 2014 ZappyLab. All rights reserved.
//

#import <Foundation/Foundation.h>

/////////////////////////////////////////////////////

@interface NSString (ZLCUtils)

-(BOOL) zlc_ableToReplaceTextInRange:(NSRange) range;
-(NSString *) zlc_stringByRemovingChainedNewlines;
-(NSString *) zlc_stringByRemovingHTMLTags;
-(NSString *) zlc_stringByRemovingEncodedCharacters;
-(NSString *) zlc_stringByRemovingHtmlTables;

-(NSString *) zlc_stringByRemovingJsonSpecialCharacters;

@end

/////////////////////////////////////////////////////
