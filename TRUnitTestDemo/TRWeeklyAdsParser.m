//
//  TRWeeklyAdsParser.m
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/27/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import "TRWeeklyAdsParser.h"
#import "TROffer.h"

@implementation TRWeeklyAdsParser
- (NSArray*) parse:(NSDictionary*)json {
    if (json == nil)
        return nil;
    NSMutableArray *result = [[NSMutableArray alloc] init];

    NSArray* weeklySpecials = [json objectForKey:@"weeklySpecials"];
    for (NSDictionary* weeklySpecial in weeklySpecials) {
        TROffer *offer = [[TROffer alloc] init];
        offer.title = [weeklySpecial objectForKey:@"title"];
        offer.price = [weeklySpecial objectForKey:@"price"];
        [result addObject:offer];
    }
    NSLog(@"Result of %d elements", [result count]);
    return result;
}
@end
