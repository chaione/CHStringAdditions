//
//  NSString+CHAdditions.m
//  ChaiOneUtils
//
//  Created by Anthony Broussard on 5/27/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "NSString+CHAdditions.h"
#import <objc/runtime.h>
static const void *STRING_PREDICATE_KEY = &STRING_PREDICATE_KEY;
@implementation NSString (CHAdditions)

- (BOOL)isBlank {
    return self.stringByStrippingWhitespace.length == 0;
}

- (BOOL)contains:(NSString *)string {
    NSRange range = [self rangeOfString:string];
    return range.location != NSNotFound;
}

- (NSString *)stringByStrippingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSUInteger)indexOfString:(NSString *)string {
    NSRange range = [self rangeOfString:string];
    return range.location;
}

- (BOOL)isValidString {
    return self && self.length > 0;
}

- (BOOL)isValidEmail {
    return [[self validEmailPredicate]evaluateWithObject:self];
}

- (NSArray *)asWords {
    NSMutableArray *array = [NSMutableArray new];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByWords usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [array addObject:substring];
    }];
    return [NSArray arrayWithArray:array];
}

- (NSArray *)asLines {
    NSMutableArray *array = [NSMutableArray new];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByLines usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [array addObject:substring];
    }];
    return [NSArray arrayWithArray:array];
}

- (NSArray *)asSentences {
    NSMutableArray *array = [NSMutableArray new];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationBySentences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [array addObject:substring];
    }];
    return [NSArray arrayWithArray:array];
}

/// Keep one instance of the predicate for each class that uses it, rather than create a global instance.
- (NSPredicate *)validEmailPredicate {
    if(!objc_getAssociatedObject(self, STRING_PREDICATE_KEY)) {
        NSString *_emailRegEx =
        @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
        @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
        @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
        @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
        @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
        NSPredicate *_sharedPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", _emailRegEx];
        objc_setAssociatedObject(self, STRING_PREDICATE_KEY, _sharedPredicate, OBJC_ASSOCIATION_RETAIN);
    }
    
    return objc_getAssociatedObject(self, STRING_PREDICATE_KEY);
}

@end
