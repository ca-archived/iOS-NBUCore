//
//  UIButton+NBUAdditions.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/10/15.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 A simple protocol to unify UIButton and UIBarButtonItem common/similar methods.
 
 - Set title, enable/disable.
 */
@protocol UIButton <NSObject>

/// The button title.
@property(nonatomic, copy) NSString * title;

/// Whether the button should be enabled or not.
@property(nonatomic, getter=isEnabled) BOOL enabled;

@end


/**
 Implementation of the UIButton protocol for UIButton objects.
 */
@interface UIButton (NBUAdditions) <UIButton>

/// The button title.
@property(nonatomic, copy) NSString * title;

/// Whether the button should be enabled or not.
@property(nonatomic, getter=isEnabled) BOOL enabled;

@end


/**
 Implementation of the UIButton protocol for UIBarButtonItem objects.
 */
@interface UIBarButtonItem (NBUAdditions) <UIButton>

@end

