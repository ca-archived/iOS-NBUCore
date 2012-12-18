//
//  NSBundle+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/08/13.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "NSBundle+NBUAdditions.h"

@implementation NSBundle (NBUAdditions)

+ (NSString *)pathForResource:(NSString *)name
                       ofType:(NSString *)extension
{
    // First try with the main bundle
    NSBundle * mainBundle = [NSBundle mainBundle];
    NSString * path = [mainBundle pathForResource:name
                                           ofType:extension];
    if (path)
    {
        return path;
    }
    
    // Otherwise try with other bundles
    NSBundle * bundle;
    for (NSString * bundlePath in [mainBundle pathsForResourcesOfType:@"bundle"
                                                          inDirectory:nil])
    {
        bundle = [NSBundle bundleWithPath:bundlePath];
        path = [bundle pathForResource:name
                                ofType:extension];
        if (path)
        {
            return path;
        }
    }
    
    NBULogVerbose(@"No path found for: %@ (.%@)", name, extension);
    return nil;
}

+ (NSArray *)loadNibNamed:(NSString *)name
                    owner:(id)owner
                  options:(NSDictionary *)options
{
    // First try with the main bundle
    NSBundle * mainBundle = [NSBundle mainBundle];
    if ([mainBundle pathForResource:name
                             ofType:@"nib"])
    {
        NBULogVerbose(@"Loaded Nib named: '%@' from mainBundle", name);
        return [mainBundle loadNibNamed:name
                                  owner:owner
                                options:options];
    }
    
    // Otherwise try with other bundles
    NSBundle * bundle;
    for (NSString * bundlePath in [mainBundle pathsForResourcesOfType:@"bundle"
                                                          inDirectory:nil])
    {
        bundle = [NSBundle bundleWithPath:bundlePath];
        if ([bundle pathForResource:name
                             ofType:@"nib"])
        {
            NBULogVerbose(@"Loaded Nib named: '%@' from bundle: '%@' ", name, bundle.bundleIdentifier);
            return [bundle loadNibNamed:name
                                  owner:owner
                                options:options];
        }
    }
    
    NBULogError(@"Couldn't load Nib named: %@", name);
    return nil;
}

@end

