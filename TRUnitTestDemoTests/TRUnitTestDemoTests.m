//
//  TRUnitTestDemoTests.m
//  TRUnitTestDemoTests
//
//  Created by Tao Xie on 11/19/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import <OCMock/OCMock.h>

#import "TRUnitTestDemoTests.h"
#import "TRNetworkService.h"
#import "TROffer.h"
#import "TRWeeklyAdsParser.h"
#import "TRViewController.h"
#import "TROffer.h"

@implementation TRUnitTestDemoTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    // STFail(@"Force Fail");
}

- (void)testExample2 {
    STAssertNotNil(@"sucess", @"It's null");
}

- (void)testExample3 {
    STAssertNotNil([NSDate date], @"Object is null");
}

- (void)testExample4 {
    STAssertEqualObjects(@"Success", @"Success", @"Not equal");
}

- (void)testOCMockPass {
    id mock = [OCMockObject mockForClass:NSString.class];
    [[[mock stub] andReturn:@"mocktest"] lowercaseString];
    
    NSString *returnValue = [mock lowercaseString];
    STAssertEqualObjects(@"mocktest", returnValue,
                         @"Should have returned the expected string.");
}

- (void)testOCMockFail {
    id mock = [OCMockObject mockForClass:NSString.class];
    [[[mock stub] andReturn:@"mocktest"] lowercaseString];
    
    NSString *returnValue = [mock lowercaseString];
    // STAssertEqualObjects(@"thisIsTheWrongValueToCheck", returnValue, @"Should have returned the expected string.");
    STAssertFalse(@"thisIsTheWrongValueToCheck" == returnValue, @"Should have returned the expected string.");
}

- (void)testAcceptsStubbedMethod {
    id mock = [OCMockObject mockForClass:[NSString class]];
	[[mock stub] lowercaseString];
	[mock lowercaseString];
}

- (void)testMethodAvail1 {
    id mock = [OCMockObject mockForClass:[TRNetworkService class]];
    [[mock stub] weeklyAds];
    [mock weeklyAds];
}

- (void)testMethodAvail2 {
    id mock = [OCMockObject mockForClass:[TRNetworkService class]];
    [[mock stub] dummyMethod1];
    [mock dummyMethod1];
}

- (void)testParser1 {
    id parserMock = [OCMockObject mockForClass:[TRWeeklyAdsParser class]];
    [[[parserMock stub] andReturn:nil] parse:nil];
    
}

- (void)testParserNil {
    TRWeeklyAdsParser *parser = [[TRWeeklyAdsParser alloc] init];
    STAssertNil([parser parse:nil], @"Should return nil");
}

- (void)testParserOneOffer {
    NSError *error;
    NSString *testJSON = @"{\"weeklySpecials\":[{\"title\":\"offer_title1\", \"price\":\"offer_price1\"}]}";
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[testJSON dataUsingEncoding:NSUTF8StringEncoding]
                                    options:kNilOptions error:&error];
    
    TRWeeklyAdsParser *parser = [[TRWeeklyAdsParser alloc] init];
    NSArray* result = [parser parse:json];
    STAssertTrue(1 == [result count], @"Should only 1 element");
    TROffer *offer = [result objectAtIndex:0];
    STAssertEqualObjects(@"offer_title1", offer.title, @"title not equal");
    STAssertEqualObjects(@"offer_price1", offer.price, @"price not equal");

    if (error) {
        STFail(@"Parsing Fail");
    }
}

- (void)testParserTwoOffers {
    NSError *error;
    NSString *testJSON =
    @"{\"weeklySpecials\":[{\"title\":\"offer_title1\", \"price\":\"offer_price1\"},{\"title\":\"offer_title2\", \"price\":\"offer_price2\"}]}";
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[testJSON dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:kNilOptions error:&error];
    
    TRWeeklyAdsParser *parser = [[TRWeeklyAdsParser alloc] init];
    NSArray* result = [parser parse:json];
    STAssertTrue(2 == [result count], @"Should only 2 element");
    
    TROffer *offer1 = [result objectAtIndex:0];
    STAssertEqualObjects(@"offer_title1", offer1.title, @"title not equal");
    STAssertEqualObjects(@"offer_price1", offer1.price, @"price not equal");
    
    TROffer *offer2 = [result lastObject];
    STAssertEqualObjects(@"offer_title2", offer2.title, @"title not equal");
    STAssertEqualObjects(@"offer_price2", offer2.price, @"price not equal");
    
    if (error) {
        STFail(@"Parsing Fail");
    }
}

- (void)testButtonAction1 {
    id netMock = [OCMockObject mockForClass:TRNetworkService.class];
    [[netMock expect] weeklyAds];
    [[netMock expect] dummyMethod1];
    
    TRViewController *controller = [[TRViewController alloc] initWithNetworkService:netMock];
    
    [controller weeklyAdsPressed:controller.weeklyAdsButton];
    [netMock verify];
}

@end
