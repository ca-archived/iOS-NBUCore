//
//  UIButton+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/10/15.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "UIButton+NBUAdditions.h"

@implementation UIButton (NBUAdditions)

@dynamic enabled;

- (void)setTitle:(NSString *)title
{
    [self setTitle:title
          forState:UIControlStateNormal];
}

- (NSString *)title
{
    return [self titleForState:UIControlStateNormal];
}

@end


@implementation UIBarButtonItem (NBUAdditions)

@dynamic title;
@dynamic enabled;

@end

