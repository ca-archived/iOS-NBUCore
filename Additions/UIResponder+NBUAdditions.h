//
//  UIResponder+NBUAdditions.h
//  NBUCore
//
//  Created by wirth_caesar on 12/08/08.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 Convenience methods to send actions through the responder chain.
 */
@interface UIResponder (NBUAdditions)

/// Send an action to through the object's responder chain.
/// @param action A selector to be invocated.
/// @param sender The sending object.
/// @param event An optional UIEvent.
/// @return Whether or not the action found a target.
- (BOOL)sendAction:(SEL)action
              from:(id)sender
          forEvent:(UIEvent*)event;

@end

