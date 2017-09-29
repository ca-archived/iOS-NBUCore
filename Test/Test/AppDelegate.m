//
//  AppDelegate.m
//  Test
//
//  Created by Ernesto Rivera on 2016/05/06.
//  Copyright (c) 2016-2017 CyberAgent Inc.
//

#import "AppDelegate.h"
#import <NBUCore/NBUCore.h>

#define __IPHONE_OS_VERSION_SOFT_MAX_REQUIRED __IPHONE_8_0
#import <NBUCore/NBUAvailability.h>

@interface AppDelegate ()

- (void)test NS_AVAILABLE_IOS(9_0);

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"AmIBeingDebugged: %@", AmIBeingDebugged() ? @"YES" : @"NO");
    
    NSLog(@"%@", self.window.rootViewController.shouldAutorotate ? @"YES" : @"NO"); // iOS 6+
    NSLog(@"%@", self.window.rootViewController.childViewControllerForStatusBarStyle); // iOS 7+
    NSLog(@"%@", self.window.rootViewController.traitCollection); // iOS 8+
    NSLog(@"%@", UIKeyboardIsLocalUserInfoKey); // iOS 9+
    
    [self test];
    
    
    
//    __NBU_APICHECK_4_1(_ios)
//    __NBU_APICHECK_7_0(_ios)
    
    return YES;
}

- (void)kk
{
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
