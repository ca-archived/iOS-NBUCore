//
//  UIApplication+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/07/26.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "UIApplication+NBUAdditions.h"
#import "RKDirectory.h"
#import "Lockbox.h"

@implementation UIApplication (NBUAdditions)

- (NSString *)applicationName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

- (NSString *)applicationVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)applicationBuild
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

- (NSURL *)documentsDirectory
{
    return [NSURL fileURLWithPath:[RKDirectory applicationDataDirectory]];
}

- (NSURL *)cachesDirectory
{
    return [NSURL fileURLWithPath:[RKDirectory cachesDirectory]];
}

+ (void)setObject:(id)object
           forKey:(NSString *)key
{
    // Set?
    if (object)
    {
        [[NSUserDefaults standardUserDefaults] setObject:object
                                                  forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    // Clear
    else
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (void)setSecureObject:(id)object
                 forKey:(NSString *)key
{
    // TODO: make object a plist string
    if (![Lockbox setString:[object description]
                     forKey:key])
    {
        NBULogError(@"Couldn't set secure object '%@' for key '%@'",
                   object, key);
    }
}

+ (id)objectForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (id)secureObjectForKey:(NSString *)key
{
    // TODO:    return [[Lockbox stringForKey:key] propertyList];
    return [Lockbox stringForKey:key];
}

@end

