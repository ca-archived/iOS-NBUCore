//
//  NSArray+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/10/16.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "NSArray+NBUAdditions.h"

@implementation NSArray (NBUAdditions)

#pragma mark - Retrieve objects

- (id)objectBefore:(id)object
{
    return [self objectBefore:object
                         wrap:NO];
}

- (id)objectBefore:(id)object
              wrap:(BOOL)wrap
{
    NSUInteger index = [self indexOfObject:object];
    
    if (index == NSNotFound ||                  // Not found?
        (!wrap && index == 0))                  // Or no wrap and was first object?
        return nil;
    
    index = (index - 1 + self.count) % self.count;
    return [self objectAtIndex:index];
}

- (id)objectAfter:(id)object
{
    return [self objectAfter:object
                        wrap:NO];
}

- (id)objectAfter:(id)object
             wrap:(BOOL)wrap
{
    NSUInteger index = [self indexOfObject:object];
    
    if (index == NSNotFound ||                  // Not found?
        (!wrap && index == self.count - 1))     // Or no wrap and was last object?
        return nil;
    
    index = (index + 1) % self.count;
    return [self objectAtIndex:index];
}

- (NSString *)shortDescription
{
    return [NSString stringWithFormat:@"(%@)", [self componentsJoinedByString:@", "]];
}

@end

