//
//  AppDelegate.m
//  NBUCoreDemo
//
//  Created by 利辺羅 on 2012/12/20.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Configure NBULog
    [NBULog setAppLogLevel:LOG_LEVEL_INFO];     // Info, warning and errors
#if defined (DEBUG) || defined (TESTING)
    [NBULog setAppLogLevel:LOG_LEVEL_VERBOSE];  // Also verbose for debug and testing builds
    [NBULog addDashboardLogger];                // Add log dashboard
#endif
    
    // Test NBULog
    NBULogTrace();
    NBULogVerbose(@"A verbose log message");
    NBULogInfo(@"TAP ME! A long info log message\nspanning\nmultiple\nlines.\nCan be expandend and collapsed");
    NBULogWarn(@"A warning log message");
    NBULogError(@"An error log message");
    
    // Prepare the window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // For now we just exit
    exit(EXIT_SUCCESS);
}

@end

