//
//  AppDelegate.m
//  NBUCoreDemo
//
//  Created by 利辺羅 on 2012/12/20.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Configure NBULog
    [NBULog setAppLogLevel:LOG_LEVEL_INFO];     // Info, warning and errors
#ifndef PRODUCTION
    [NBULog setAppLogLevel:LOG_LEVEL_VERBOSE];  // Also verbose for debug and testing builds
    [NBULog addDashboardLogger];                // Add log dashboard
#endif
    
    NBULogTrace();
    
    // Prepare the window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController * rootController = [[[NSBundle mainBundle] loadNibNamed:@"MainController"
                                                                         owner:self
                                                                       options:nil] objectAtIndex:0];
    self.window.rootViewController = rootController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

