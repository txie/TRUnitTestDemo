//
//  TranslateProtocol.h
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/30/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TranslateProtocol <NSObject>
- (NSString*)translate:(NSString*)source;
@end
