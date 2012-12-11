//
//  UIView+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/08/06.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "UIView+NBUAdditions.h"

// Set Logging Component
#undef RKLogComponent
#define RKLogComponent lcl_cBaseUI

@implementation UIView (NBUAdditions)

#pragma mark - Properties

- (void)setOrigin:(CGPoint)origin
{
    CGSize size = self.size;
    self.frame = CGRectMake(origin.x,
                            origin.y,
                            size.width,
                            size.height);
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setSize:(CGSize)size
{
    CGPoint origin = self.origin;
    self.frame = CGRectMake(origin.x,
                            origin.y,
                            size.width,
                            size.height);
}

- (CGSize)size
{
    return self.frame.size;
}

#pragma mark - Controllers

- (UIViewController *)viewController
{
    for (UIResponder * nextResponder = self.nextResponder;
         nextResponder;
         nextResponder = nextResponder.nextResponder)
    {
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController *)nextResponder;
    }
    
    // Not found
    NBULogVerbose(@"%@ doesn't seem to have a viewController", self);
    return nil;
}

- (UINavigationController *)navigationController
{
    return self.viewController.navigationController;
}

- (UITabBarController *)tabBarController
{
    return self.viewController.tabBarController;
}

@end

