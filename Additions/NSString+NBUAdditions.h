//
//  NSString+NBUAdditions.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/08/10.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 Convenience methods for handling strings.
 */
@interface NSString (NBUAdditions)

/// Check whether a string contains another string.
/// @param string The substring to look for.
- (BOOL)containsString:(NSString *)string;

@end

