//
//  TROffer.m
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/27/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import "TROffer.h"

@implementation TROffer
- (NSString*)description {
    return [NSString stringWithFormat:@"(%@, %@)", _title, _price];
}
@end
