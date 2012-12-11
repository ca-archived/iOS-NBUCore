//
//  NSArray+NBUAdditions.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/10/16.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 Convenience NSArray methods to retrieve the previous/next elements with/without wrapping.
 */
@interface NSArray (NBUAdditions)

/// @name Retrieve Objects

/// Get the previous object without wrap.
/// @param object The reference object.
/// @return The previous object or `nil` if not found.
- (id)objectBefore:(id)object;

/// Get the previous object with ot without wrap.
/// @param object The reference object.
/// @param wrap Whether to cirularly wrap the array to get the previous element.
/// @return The previous object or `nil` if not found.
- (id)objectBefore:(id)object
              wrap:(BOOL)wrap;

/// Get the next object without wrap.
/// @param object The reference object.
/// @return The next object or `nil` if not found.
- (id)objectAfter:(id)object;

/// Get the next object with ot without wrap.
/// @param object The reference object.
/// @param wrap Whether to cirularly wrap the array to get the next element.
/// @return The next object or `nil` if not found.
- (id)objectAfter:(id)object
             wrap:(BOOL)wrap;

@end

