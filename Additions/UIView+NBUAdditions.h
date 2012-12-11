//
//  UIView+NBUAdditions.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/08/06.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 NBUCore additions to UIViews.
 
 - Ease access to view's size, origin, UIViewController, UINavigationController and UITabBarController
 */
@interface UIView (NBUAdditions)

/// @name Properties

/// Easily access/modify a view's frame size.
@property(nonatomic) CGSize size;

/// Easily access/modify a view's frame origin.
@property(nonatomic) CGPoint origin;

/// @name Access Controllers

/// Convenience method to access a view's related UIViewController.
/// @warning You should not retain this value to avoid circular dependencies.
@property (nonatomic, readonly) UIViewController * viewController;

/// Convenience method to access a view's controller related UINavigationController.
/// @warning You should not retain this value to avoid circular dependencies.
@property (nonatomic, readonly) UINavigationController * navigationController;

/// Convenience method to access a view's controller related UITabBarController.
/// @warning You should not retain this value to avoid circular dependencies.
@property (nonatomic, readonly) UITabBarController * tabBarController;

@end

