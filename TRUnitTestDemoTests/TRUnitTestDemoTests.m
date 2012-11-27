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
#import "TRViewController.h"

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

- (void)testButtonAction1 {
    TRViewController *controller = [[TRViewController alloc] init];
    id netMock = [OCMockObject mockForClass:[TRNetworkService class]];
    [[netMock expect] weeklyAds];
    [controller weeklyAdsPressed:controller.weeklyAdsButton];
    [netMock verify];
}

- (void)testNetError {
    id netMock = [OCMockObject mockForClass:[TRNetworkService class]];
    [netMock stub] andReturn:@"Error" 
}

@end
