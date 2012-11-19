//
//  TRViewController.m
//  TRUnitTestDemo
//
//  Created by Tao Xie on 11/19/12.
//  Copyright (c) 2012 Tao Xie. All rights reserved.
//

#import "TRViewController.h"
#import "TRNetworkService.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (IBAction)weeklyAdsPressed:(id)sender {
    TRNetworkService *networkService = [[TRNetworkService alloc] init];
    [networkService weeklyAds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
