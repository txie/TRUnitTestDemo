//
//  TranslateServiceTests.m
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/30/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import "TranslateServiceTests.h"
#import "TranslateProtocol.h"
#import "CapitalizedTranslateService.h"
#import <OCMock/OCMock.h>

@implementation TranslateServiceTests
- (void)testCapTranslate1 {
    id mock = [OCMockObject mockForProtocol:@protocol(TranslateProtocol)];
    
    [[[mock stub] andReturn:nil] translate:nil];
    [[[mock stub] andReturn:@"Good"] translate:@"gOOd"];
    
    CapitalizedTranslateService *capTranslator = [[CapitalizedTranslateService alloc] init];
 
    STAssertEqualObjects([capTranslator translate:@"good"], [mock translate:@"gOOd"],
                         @"Should have returned the expected string.");
    STAssertEqualObjects(([capTranslator translate:@"special_case"]), [mock translate:@"special_case"],
                         @"Special Case");
}

@end
