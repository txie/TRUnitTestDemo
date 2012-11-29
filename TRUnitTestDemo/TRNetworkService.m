//
//  TRNetworkService.m
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/19/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import "TRNetworkService.h"
#import "TRWeeklyAdsParser.h"
#import "TRService.h"

#define HOSTNAME @"www.safeway.com"

@implementation TRNetworkService

- (void) weeklyAds {
    // http://www.safeway.com/emmd/service/offer/weeklySpecial/4601?Brand=safeway
    // (no credential needed)
        
    MKNetworkEngine *safewayEngine = [[MKNetworkEngine alloc] initWithHostName:HOSTNAME customHeaderFields:nil];
    
    NSDictionary *params = @{@"brand" : @"safeway"};
    MKNetworkOperation* op = [safewayEngine operationWithPath:@"emmd/service/offer/weeklySpecial/4601" params:(NSMutableDictionary*)params httpMethod:@"GET" ssl:NO];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *json = [op responseJSON];
        TRWeeklyAdsParser *weeklyAdsParser = [[TRWeeklyAdsParser alloc] init];
        [weeklyAdsParser parse:json];
    }
    onError:^(NSError *error) {
        [[[TRService alloc] init] logError:error.description];
    }];
    [safewayEngine enqueueOperation: op];
}

- (void) dummyMethod1 {
    NSLog(@"dummyMethod1");
}
- (void) dummyMethod2:(NSString*)message {
    NSLog(@"dummyMethod2 called with message: %@", message);
}

- (int) lengthCompare:(NSString*)str {
    NSString *sampleStr = @"sample";
    if (str == nil)
        return -1;
    if (str.length == sampleStr.length)
        return 0;
    else if (str.length > sampleStr.length)
        return 1;
    else
        return -1;
}

@end
