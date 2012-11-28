//
//  TRViewController.h
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/19/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRNetworkService.h"

@interface TRViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton* weeklyAdsButton;
@property (nonatomic, strong) TRNetworkService *networkService;

- (id)initWithNetworkService:(TRNetworkService*)networkService;
- (IBAction)weeklyAdsPressed:(id)sender;
@end
