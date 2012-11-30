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
    
    NSLog(@"%s %s %s:%d someObject=%@", __PRETTY_FUNCTION__, __FILE__, __func__, __LINE__, @"Hello");
    
    NSLog(@"%@", [NSThread callStackSymbols]);
    NSLog(@"%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent]);
    NSLog(@"%@", NSStringFromClass([self class]));
    NSLog(@"%@", NSStringFromSelector(_cmd));

    DLog(@"object is %@", @"Hello");
    DebugLog(@"Object is %@", @"World");
    // DebugLog(@"Dump here %@", [NSThread callStackSymbols]);
    // DumpStack();
    DumpStack(@"Dump %@", @"Here");
    DumpStack(@"hello");
    
    [_networkService weeklyAds];
    if (YES == YES)
        [_networkService dummyMethod1];
    [_networkService lengthCompare:@"hello"];
}

- (id)initWithNetworkService:(TRNetworkService*)networkService {
    if ((self = [[TRViewController alloc] init])) {
        if (networkService)
            _networkService = networkService;
        else {
            _networkService = [[TRNetworkService alloc] init];
        }
        return self;
    }
    return nil;
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
