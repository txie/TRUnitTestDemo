//
//  TRNetworkService.m
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/19/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import "TRNetworkService.h"

#define HOSTNAME @"www.safeway.com"

@implementation TRNetworkService
- (void) weeklyAds {
    // http://www.safeway.com/emmd/service/offer/weeklySpecial/4601?Brand=safeway
    // (no credential needed)
    
    MKNetworkEngine *safewayEngine = [[MKNetworkEngine alloc] initWithHostName:HOSTNAME customHeaderFields:nil];
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSDictionary *params = @{@"brand" : @"safeway"};
    MKNetworkOperation* op = [safewayEngine operationWithPath:@"emmd/service/offer/weeklySpecial/4601" params:(NSMutableDictionary*)params httpMethod:@"GET" ssl:NO];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *json = [op responseJSON];
        // NSLog(@"weeklySpecial response: %@", json);
        NSArray* weeklySpecials = [json objectForKey:@"weeklySpecials"];
        for (NSDictionary* weeklySpecial in weeklySpecials) {
            [result addObject:[weeklySpecial objectForKey:@"title"]];
            // NSLog(@"%@ %@", [weeklySpecial objectForKey:@"title"], [weeklySpecial objectForKey:@"price"]);
        }
        NSMutableArray *searchResults = (NSMutableArray*)[[NSSet setWithArray:result] allObjects];
        NSLog(@"catalog Results: %@", searchResults);        
    }
     onError:^(NSError *error) {
         NSLog(@"%@", error);
     }];
    [safewayEngine enqueueOperation: op];
}

@end
