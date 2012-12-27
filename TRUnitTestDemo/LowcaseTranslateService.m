//
//  LowcaseTranslateService.m
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/30/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import "LowcaseTranslateService.h"

@implementation LowcaseTranslateService
- (NSString*)translate:(NSString*)source {
    if (source) {
        return [source lowercaseString];
    }
    return nil;
}
@end
