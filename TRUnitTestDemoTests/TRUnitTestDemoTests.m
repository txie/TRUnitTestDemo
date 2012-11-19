//
//  TRUnitTestDemoTests.m
//  TRUnitTestDemoTests
//
//  Created by Tao Xie on 11/19/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import "TRUnitTestDemoTests.h"

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
    STFail(@"Unit tests are not implemented yet in TRUnitTestDemoTests");
}

- (void)testExample2 {
    STAssertNotNil(@"sucess", @"it's null");
}

- (void)testExample3 {
    STAssertNotNil(nil, @"object is null");
}

- (void)testExample4 {
    STAssertEqualObjects(@"Success", @"Success", @"not equal");
}
@end
