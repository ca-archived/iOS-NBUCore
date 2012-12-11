//
//  UITabBarController+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/09/18.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "UITabBarController+NBUAdditions.h"

// Set Logging Component
#undef RKLogComponent
#define RKLogComponent lcl_cBaseUI

@implementation UITabBarController (NBUAdditions)

- (BOOL)isTabBarHidden
{
    return CGRectGetMaxY([UIScreen mainScreen].applicationFrame) < CGRectGetMaxY(self.view.frame);
}

- (void)setTabBarHidden:(BOOL)tabBarHidden
{
    [self setTabBarHidden:tabBarHidden
                 animated:NO];
}

- (void)setTabBarHidden:(BOOL)hidden
               animated:(BOOL)animated
{
    NBULogVerbose(@"setTabBarHidden: %@", NSStringFromBOOL(hidden));
    
    [UIView animateWithDuration:animated ? UINavigationControllerHideShowBarDuration : 0.0
                          delay:0.0
                        options:(UIViewAnimationOptionAllowUserInteraction |
                                 UIViewAnimationOptionLayoutSubviews |
                                 UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         
                         CGRect frame = [UIScreen mainScreen].applicationFrame;
                         if (hidden)
                         {
                             frame.size.height += self.tabBar.size.height;
                         }
                         self.view.frame = frame;
                     }
                     completion:NULL];
}

@end
