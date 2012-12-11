//
//  NSString+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/08/10.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "NSString+NBUAdditions.h"

@implementation NSString (NBUAdditions)

- (BOOL)containsString:(NSString *)string
{
    return [self rangeOfString:string].location != NSNotFound;
}

@end

