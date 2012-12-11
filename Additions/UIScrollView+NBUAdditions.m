//
//  UIScrollView+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/10/17.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "UIScrollView+NBUAdditions.h"

@implementation UIScrollView (NBUAdditions)

#pragma mark - Scroll to edges

- (void)scrollToTopAnimated:(BOOL)animated
{
    [self scrollRectToVisible:CGRectMake(self.contentOffset.x,
                                         0.0,
                                         1.0,
                                         1.0)
                     animated:animated];
}

- (void)scrollToBottomAnimated:(BOOL)animated
{
    [self scrollRectToVisible:CGRectMake(self.contentOffset.x,
                                         self.contentSize.height - 1.0,
                                         1.0,
                                         1.0)
                     animated:animated];
}

- (void)scrollToLeftAnimated:(BOOL)animated
{
    [self scrollRectToVisible:CGRectMake(0.0,
                                         self.contentOffset.y,
                                         1.0,
                                         1.0)
                     animated:animated];
}

- (void)scrollToRightAnimated:(BOOL)animated
{
    [self scrollRectToVisible:CGRectMake(self.contentSize.width - 1.0,
                                         self.contentOffset.y,
                                         1.0,
                                         1.0)
                     animated:animated];
}

@end

