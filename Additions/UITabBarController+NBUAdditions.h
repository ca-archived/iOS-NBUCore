//
//  UITabBarController+NBUAdditions.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/09/18.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 UITabBarController category to provide tabBar show/hide functionality.
 */
@interface UITabBarController (NBUAdditions)

/// Wheter the UITabBar is hidden. Modifying this value shows/hides the tabBar.
@property(nonatomic,getter=isTabBarHidden) BOOL tabBarHidden;

/// Show/hide the UITabBar with animation.
/// @param hidden Whether the tabBar should be hidden.
/// @param animated Whether the change should be animated.
- (void)setTabBarHidden:(BOOL)hidden
               animated:(BOOL)animated;

@end
