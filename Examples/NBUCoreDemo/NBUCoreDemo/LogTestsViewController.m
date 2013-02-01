//
//  LogTestsViewController.m
//  NBUCoreDemo
//
//  Created by 利辺羅 on 2012/12/20.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "LogTestsViewController.h"

@implementation LogTestsViewController

@synthesize textView = _textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [NBULog setAppLogLevel:LOG_LEVEL_VERBOSE];
    
    // Configure text view
    UIApplication * application = [UIApplication sharedApplication];
    _textView.text = [NSString stringWithFormat:@"%@: %@\n%@: %@\n%@: %@\n%@: %@\n%@: %@",
                      @"Application name",      application.applicationName,
                      @"Version",               application.applicationVersion,
                      @"Build",                 application.applicationBuild,
                      @"Documents directory",   application.documentsDirectory.lastPathComponent,
                      @"Caches directory",      application.cachesDirectory.lastPathComponent];
}

- (IBAction)changeLogLevel:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex)
    {
        case 0:
            [NBULog setAppLogLevel:LOG_LEVEL_VERBOSE];
            break;
        case 1:
            [NBULog setAppLogLevel:LOG_LEVEL_INFO];
            break;
        case 2:
            [NBULog setAppLogLevel:LOG_LEVEL_WARN];
            break;
        case 3:
            [NBULog setAppLogLevel:LOG_LEVEL_ERROR];
            break;
        case 4:
            [NBULog setAppLogLevel:LOG_LEVEL_OFF];
            break;
    }
    
    // Quick test
    NBULogTrace();
    NBULogVerbose(@"Changing log level...");
    NBULogVerbose(@"A verbose log message");
    NBULogInfo(@"App log level changed");
    NBULogInfo(@"TAP ME! A long info log message\nspanning\nmultiple\nlines.\nCan be expandend and collapsed");
    NBULogWarn(@"Do not use NSLog anymore");
    NBULogError(@"Mock error message");
}

- (IBAction)testTrace:(id)sender
{
    NBULogTrace();
}

- (IBAction)testVerbose:(id)sender
{
    NBULogVerbose(@"Verbose test");
}

- (IBAction)testInfo:(id)sender
{
    NBULogInfo(@"Info test");
}

- (IBAction)testWarn:(id)sender
{
    NBULogWarn(@"Warn test");
}

- (IBAction)testError:(id)sender
{
    NBULogError(@"Error test");
}

@end

