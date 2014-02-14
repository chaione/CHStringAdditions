//
//  NSString+CHAdditions.h
//  ChaiOneUtils
//
//  Created by Anthony Broussard on 5/27/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CHAdditions)

/// Returns YES is the string is compromised of only whitespace and or newline characters
- (BOOL)isBlank;

/// Returns YES is the string contains otherString, NO otherwise.
- (BOOL)contains:(NSString *)otherString;

/// Removes all whitespace and newline characters from the string
- (NSString *)stringByStrippingWhitespace;

/// Returns the index of str, or NSNotFound if it does not exist
- (NSUInteger)indexOfString:(NSString *)string;

/// Returns is the string is valid, that is, it contains at least 1 character and is not null
- (BOOL)isValidString;

/// Returns YES is the email address is valid, NO otherwise.
/// Regex was pulled from http://www.regular-expressions.info/email.html
- (BOOL)isValidEmail;

/// Divides the string into words and returns and array of the divided words in the order that they appear.
- (NSArray *)asWords;

/// Divides the string into lines and returns and array of the divided lines in the order that they appear.
- (NSArray *)asLines;

/// Divides the string into sentences and returns and array of the divided sentences in the order that they appear.
- (NSArray *)asSentences;

@end
