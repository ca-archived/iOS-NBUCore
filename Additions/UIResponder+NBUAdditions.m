//
//  UIResponder+NBUAdditions.m
//  NBUCore
//
//  Created by wirth_caesar on 12/08/08.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "UIResponder+NBUAdditions.h"

// Set Logging Component
#undef RKLogComponent
#define RKLogComponent lcl_cBaseUI

@implementation UIResponder (NBUAdditions)

- (BOOL)sendAction:(SEL)action
              from:(id)sender
          forEvent:(UIEvent*)event
{
    if([self canPerformAction:action withSender:sender]) {
        // This is fishy, so it needs some explanation
        // ARC performs its magic in part based on method names
        // ie. newObject vs object determines whether it retains it or not
        // Since we are passing in an unknown selector, the compiler doesn't know
        // if it has to deal with the memory.
        // Without the diagnostic ignores, you will get a warning:
        // "PerformSelector may cause a leak because its selector is unknown"
        // So as long as you don't call methods that it has to release/autorelease the output of,
        // you should be OK
        // Source: http://stackoverflow.com/questions/7017281/performselector-may-cause-a-leak-because-its-selector-is-unknown
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:action withObject:sender];
#pragma clang diagnostic pop
        return YES;
    } 
    // Try the next one if there is one
    else if(self.nextResponder) {
        return [self.nextResponder sendAction:action from:sender forEvent:event];
    }
    
    // Otherwise it cannot be handled
    return NO;
}

@end
