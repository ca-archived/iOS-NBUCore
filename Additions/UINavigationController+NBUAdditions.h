//
//  UINavigationController+NBUAdditions.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/10/04.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 Convenience UINavigationController methods.
 
 - Actions that can be invoked from UIButtons through the first responder.
 */
@interface UINavigationController (NBUAdditions)

/// @name Properties

/// Shortcut to get/set the first view controller.
/// @note When set all other controllers will be removed.
@property(nonatomic, retain) UIViewController * rootViewController;

/// @name Actions

/// Pop the top view controller.
/// @param sender The sender object.
- (IBAction)popViewController:(id)sender;

/// Pop to the root view controller.
/// @param sender The sender object.
- (IBAction)popToRootViewController:(id)sender;

/// Dismiss the controller if it is being presented modally.
/// @param sender The sender object.
- (IBAction)dismiss:(id)sender;

@end

