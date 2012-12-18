//
//  UINavigationController+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/10/04.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "UINavigationController+NBUAdditions.h"

@implementation UINavigationController (NBUAdditions)

#pragma mark - Properties

- (UIViewController *)rootViewController
{
    NSArray * controllers = self.viewControllers;
    return controllers.count > 0 ? controllers[0] : nil;
}

- (void)setRootViewController:(UIViewController *)rootViewController
{
    self.viewControllers = rootViewController ? @[rootViewController] : nil;
}

#pragma mark - Actions

- (IBAction)popViewController:(id)sender
{
    NBULogTrace();
    
    [self popViewControllerAnimated:YES];
}

- (IBAction)popToRootViewController:(id)sender
{
    NBULogTrace();
    
    [self popToRootViewControllerAnimated:YES];
}

- (IBAction)dismiss:(id)sender
{
    NBULogTrace();
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0"))
    {
        [self dismissViewControllerAnimated:YES
                                 completion:NULL];
    }
    else
    {
        [self dismissModalViewControllerAnimated:YES];
    }
}

@end

