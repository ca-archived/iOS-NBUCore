//
//  AppDelegate.m
//  NBUCoreDemo
//
//  Created by Ernesto Rivera on 2012/12/20.
//  Copyright (c) 2012-2013 CyberAgent Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Configure NBULog
    [NBULog registerAppContextWithModulesAndNames:@{@(1) : @"Module 1",
                                                    @(2) : @"Module 2",
                                                    @(3) : @"Module 3"}];
//    [NBULog setAppLogLevel:LOG_LEVEL_INFO];     // Info, warning and errors only
#ifdef DEBUG
//    [NBULog setAppLogLevel:LOG_LEVEL_VERBOSE];  // Also verbose for DEBUG builds
#endif
    
#if defined (DEBUG) ||  defined (TESTING)
    // Add dashboard logger
    [NBULog addDashboardLogger];
#endif
    
    NBULogTrace();
    
    NSLog(@"This NSLog will only appear on DEBUG builds");
    
    // Try a log from a backgroud thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NBULogInfo(@"Message from another thread");
    });
    
    // Prepare the window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController * rootController = [[NSBundle mainBundle] loadNibNamed:@"MainController"
                                                                        owner:self
                                                                      options:nil][0];
    self.window.rootViewController = rootController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

