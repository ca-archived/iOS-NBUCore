//
//  NBUActionSheet.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/11/12.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "NBUActionSheet.h"

@interface NBUActionSheet (Private) <UIActionSheetDelegate>

@end

@implementation NBUActionSheet

@synthesize selectedButtonBlock = _selectedButtonBlock;
@synthesize cancelButtonBlock = _cancelButtonBlock;

- (void)setDelegate:(id<UIActionSheetDelegate>)delegate
{
    if (delegate && delegate != self)
    {
        NBULogWarn(@"Delegate '%@' will be ignored. Set selectedButtonBlock and/or cancelButtonBlock instead.",
                     delegate);
    }
    super.delegate = self;
}

- (void)showInView:(UIView *)view
{
    self.delegate = self;
    
    [super showInView:view];
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
    self.delegate = self;
    
    [super showFromRect:rect inView:view animated:animated];
}

- (void)showFromToolbar:(UIToolbar *)view
{
    self.delegate = self;
    
    [super showFromToolbar:view];
}

- (void)showFromTabBar:(UITabBar *)view
{
    self.delegate = self;
    
    [super showFromTabBar:view];
}

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
    self.delegate = self;
    
    [super showFromBarButtonItem:item animated:animated];
}

#pragma mark - Delegate methods

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != self.cancelButtonIndex)
    {
        NSInteger selectedIndex = self.cancelButtonIndex == 0 ? buttonIndex - 1 : buttonIndex;
        
        NBULogVerbose(@"Selected button at index: %d", selectedIndex);
        if (_selectedButtonBlock)
        {
            _selectedButtonBlock(selectedIndex);
        }
    }
    else
    {
        NBULogVerbose(@"Canceled");
        if (_cancelButtonBlock) _cancelButtonBlock();
    }
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    NBULogTrace();
    
    if (_cancelButtonBlock) _cancelButtonBlock();
}

@end

