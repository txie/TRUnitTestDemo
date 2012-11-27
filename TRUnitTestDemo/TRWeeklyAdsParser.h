//
//  TRWeeklyAdsParser.h
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/27/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRWeeklyAdsParser : NSObject
- (NSArray*) parse:(NSDictionary*)json;
@end
