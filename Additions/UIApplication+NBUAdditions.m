//
//  UIApplication+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/07/26.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "UIApplication+NBUAdditions.h"
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
    NSError * error;
    NSURL * url = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                         inDomain:NSUserDomainMask
                                                appropriateForURL:nil
                                                           create:YES
                                                            error:&error];
    if (error)
    {
        NBULogError(@"Can't find the %@: %@", THIS_METHOD, error);
    }
    return url;
}

- (NSURL *)cachesDirectory
{
    NSError * error;
    NSURL * url = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory
                                                         inDomain:NSUserDomainMask
                                                appropriateForURL:nil
                                                           create:YES
                                                            error:&error];
    if (error)
    {
        NBULogError(@"Can't find the %@: %@", THIS_METHOD, error);
    }
    return url;
}

- (NSURL *)libraryDirectory
{
    NSError * error;
    NSURL * url = [[NSFileManager defaultManager] URLForDirectory:NSLibraryDirectory
                                                         inDomain:NSUserDomainMask
                                                appropriateForURL:nil
                                                           create:YES
                                                            error:&error];
    if (error)
    {
        NBULogError(@"Can't find the %@: %@", THIS_METHOD, error);
    }
    return url;
}

#pragma mark - NSUserDefaults

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

+ (id)objectForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

#pragma mark - Keychain

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

+ (id)secureObjectForKey:(NSString *)key
{
    // TODO:    return [[Lockbox stringForKey:key] propertyList];
    return [Lockbox stringForKey:key];
}

@end

