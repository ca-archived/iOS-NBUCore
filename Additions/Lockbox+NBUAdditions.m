//
//  Lockbox+NBUAdditions.m
//  NBUCore
//
//  Created by エルネスト 利辺羅 on 12/06/20.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "Lockbox+NBUAdditions.h"

@implementation Lockbox (NBUAdditions)

+ (BOOL)setDictionary:(NSDictionary *)value forKey:(NSString *)key
{
    NSMutableArray * keysAndValues = [NSMutableArray arrayWithArray:value.allKeys];
    [keysAndValues addObjectsFromArray:value.allValues];
    
    return [Lockbox setArray:keysAndValues
                      forKey:key];
}

+ (NSDictionary *)dictionaryForKey:(NSString *)key
{
    NSArray * keysAndValues = [Lockbox arrayForKey:key];
    
    if (!keysAndValues || keysAndValues.count == 0)
        return nil;
    
    if ((keysAndValues.count % 2) != 0)
    {
//        NBULogWarn(@"Dictionary for %@ was not saved properly to keychain", key);
        return nil;
    }
    
    NSUInteger half = keysAndValues.count / 2;
    NSRange keys = NSMakeRange(0, half);
    NSRange values = NSMakeRange(half, half);
    return [NSDictionary dictionaryWithObjects:[keysAndValues subarrayWithRange:values] 
                                       forKeys:[keysAndValues subarrayWithRange:keys]];
}

@end

