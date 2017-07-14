//
// Created by Ilya Dyakonov on 11/09/14.
// Copyright (c) 2014 ZappyLab. All rights reserved.
//

#import "NSString+ZLCUtils.h"

/////////////////////////////////////////////////////

@implementation NSString (ZLCUtils)

-(BOOL) zlc_ableToReplaceTextInRange:(NSRange) range
{
    return range.location + range.length <= self.length;
}

#pragma mark - Chained newlines

-(NSString *) zlc_stringByRemovingChainedNewlines
{
    NSError *error = nil;
    NSRegularExpression *chainedNewlinesExpression = [NSRegularExpression regularExpressionWithPattern:@"\n\n+"
                                                                                               options:NSRegularExpressionCaseInsensitive
                                                                                                 error:&error];
    NSString *stringWithCollapsedNewlineSequences = [chainedNewlinesExpression stringByReplacingMatchesInString:self
                                                                                                        options:kNilOptions
                                                                                                          range:NSMakeRange(0, self.length)
                                                                                                   withTemplate:@"\n"];
    return [stringWithCollapsedNewlineSequences zlc_stringByRemovingPrefixingNonAlphanumericCharacters];
}

-(NSString *) zlc_stringByRemovingPrefixingNonAlphanumericCharacters
{
    NSString *result = nil;
    NSRange firstAlphanumericCharacterGroupRange = [self rangeOfCharacterFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (firstAlphanumericCharacterGroupRange.location == 0)
    {
        // string has non-alphanumeric prefix
        result = [self stringByReplacingCharactersInRange:firstAlphanumericCharacterGroupRange
                                               withString:@""];
    }
    else
    {
        result = self;
    }

    return result;
}

#pragma mark - HTML tags

-(NSString *) zlc_stringByRemovingHTMLTags
{
    NSError *error = nil;
    NSRegularExpression *htmlTagExpression = [NSRegularExpression regularExpressionWithPattern:@"<[^>]+>"
                                                                                       options:NSRegularExpressionCaseInsensitive
                                                                                         error:&error];
    NSString *preparedString = [self zlc_stringByDecodedAngleBrackets];
    NSString *stringWithoutTags =
    [htmlTagExpression stringByReplacingMatchesInString:preparedString
                                                options:kNilOptions
                                                  range:NSMakeRange(0, preparedString.length)
                                           withTemplate:@""];
    return stringWithoutTags;
}

-(NSString *) zlc_stringByDecodedAngleBrackets
{
    NSString *stringWithoutLeftAngleBracket = [self stringByReplacingOccurrencesOfString:@"&lt;"
                                                                              withString:@"<"];
    return [stringWithoutLeftAngleBracket stringByReplacingOccurrencesOfString:@"&gt;"
                                                                    withString:@">"];
}

-(NSString *) zlc_stringByRemovingEncodedCharacters
{
    NSError *error = nil;
    NSRegularExpression *encodedSymbolsExpression = [NSRegularExpression regularExpressionWithPattern:@"&[^;]+;"
                                                                                              options:NSRegularExpressionCaseInsensitive
                                                                                                error:&error];
    return [encodedSymbolsExpression stringByReplacingMatchesInString:self
                                                              options:kNilOptions
                                                                range:NSMakeRange(0, self.length)
                                                         withTemplate:@" "];
}

-(NSString *) zlc_stringByRemovingJsonSpecialCharacters
{
    NSError *error = nil;
    NSRegularExpression *jsonSrecialCharactersExpression = [NSRegularExpression regularExpressionWithPattern:@"\b|\f|\n|\r|\t|\""
                                                                                                     options:NSRegularExpressionCaseInsensitive
                                                                                                       error:&error];
    
    return [jsonSrecialCharactersExpression stringByReplacingMatchesInString:self
                                                                     options:kNilOptions
                                                                       range:NSMakeRange(0, self.length)
                                                                withTemplate:@""];
}

-(NSString *) zlc_stringByRemovingHtmlTables
{
    NSError *error = nil;
    NSRegularExpression *encodedSymbolsExpression = [NSRegularExpression regularExpressionWithPattern:@"<table[^>]*>(?:.|\n)*?<\/table>"
                                                                                              options:NSRegularExpressionCaseInsensitive
                                                                                                error:&error];
    return [encodedSymbolsExpression stringByReplacingMatchesInString:self
                                                              options:kNilOptions
                                                                range:NSMakeRange(0, self.length)
                                                         withTemplate:@""];
}

@end

/////////////////////////////////////////////////////
