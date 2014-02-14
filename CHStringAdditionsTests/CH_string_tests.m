//
//  CH_string_tests.m
//  ChaiKit-ios
//
//  Created by Terry Lewis II on 1/24/14.
//  Copyright (c) 2014 Terry Lewis. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+CHAdditions.h"

@interface CH_string_tests : XCTestCase

@end

@implementation CH_string_tests

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)test_string_functions {
    XCTAssertTrue(@"    \n".isBlank, @"Should be true");
    XCTAssertTrue([@"these are fun tests yup" contains:@"yup"], @"Should be true");
    NSString *trimmed = @"   this is a string   ".stringByStrippingWhitespace;
    XCTAssertEqualObjects(trimmed, @"this is a string", @"Strings should be equal");
    
    XCTAssertTrue([@"this is a string yes indeed" indexOfString:@"yes"] == 17, @"index should be 17");
    XCTAssertTrue(@"1".isValidString, @"should be true");
    
    XCTAssertTrue(@"abc@123.com".isValidEmail, @"should be true");
    XCTAssertFalse(@"abc@.com".isValidEmail, @"Should be false");
}

- (void)test_words_function {
    NSString *wordString = @"This is a string of determinate length and size that will be broken into words.";

    NSArray *words = wordString.asWords;
    XCTAssertTrue(words.count == 15, @"There are 15 words in wordString, so there should be 15 items in words");
}

- (void)test_lines_function {
    NSString *wordString = @"This is a\n string of\n determinate length and size\n that will\n be broken into asLines.";

    NSArray *asLines = wordString.asLines;
    XCTAssertTrue(asLines.count == 5, @"There are 5 lines in wordString, so there should be 5 items in asLines");
}

- (void)test_sentences_function {
    NSString *wordString = @"This is a string of determinate length and size. This String will be broken into sentences."
            "Will there be sentences in the string? Indeed there will be!";

    NSArray *sentences = wordString.asSentences;
    XCTAssertTrue(sentences.count == 4, @"There are 4 sentences in wordString, so there should be 4 items in sentences");
}

@end
