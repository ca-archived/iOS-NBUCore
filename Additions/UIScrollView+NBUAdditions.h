//
//  UIScrollView+NBUAdditions.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/10/17.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 Methods to easily scroll a UIScrollView to any edge.
 */
@interface UIScrollView (NBUAdditions)

/// @name Scroll to Edges

/// Scroll to the top.
/// @param animated Whether to animate scrolling or not.
- (void)scrollToTopAnimated:(BOOL)animated;

/// Scroll to the bottom.
/// @param animated Whether to animate scrolling or not.
- (void)scrollToBottomAnimated:(BOOL)animated;

/// Scroll to the left.
/// @param animated Whether to animate scrolling or not.
- (void)scrollToLeftAnimated:(BOOL)animated;

/// Scroll to the right.
/// @param animated Whether to animate scrolling or not.
- (void)scrollToRightAnimated:(BOOL)animated;

@end

