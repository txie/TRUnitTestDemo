//
//  TranslateService.m
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/30/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import "CapitalizedTranslateService.h"

@implementation CapitalizedTranslateService
- (NSString*)translate:(NSString*)source {
    if (source) {
        if ([source isEqualToString:@"special_case"])
            return @"SpEcial_cASe";
        else
            return [source capitalizedString];
    }
    return nil;
}
@end
