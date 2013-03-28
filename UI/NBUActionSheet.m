//
//  NBUActionSheet.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/11/12.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "NBUActionSheet.h"

// Private category
@interface NBUActionSheet (Private) <UIActionSheetDelegate>

@end


@implementation NBUActionSheet

@synthesize selectedButtonBlock = _selectedButtonBlock;
@synthesize cancelButtonBlock = _cancelButtonBlock;

- (id)initWithTitle:(NSString *)title
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
selectedButtonBlock:(NBUActionSheetSelectedButtonBlock)selectedButtonBlock
  cancelButtonBlock:(NBUActionSheetCancelButtonBlock)cancelButtonBlock
{
    self = [super initWithTitle:title
                       delegate:nil
              cancelButtonTitle:DEVICE_IS_IPHONE_IDIOM ? cancelButtonTitle : nil
         destructiveButtonTitle:destructiveButtonTitle
              otherButtonTitles:nil];
    if (self)
    {
        for (NSString * otherButtonTitle in otherButtonTitles)
        {
            [self addButtonWithTitle:otherButtonTitle];
        }
        self.selectedButtonBlock = selectedButtonBlock;
        self.cancelButtonBlock = cancelButtonBlock;
    }
    return self;
}

- (void)showFrom:(id)target
{
    if ([target isKindOfClass:[UIView class]])
    {
        [self showFromView:target];
    }
    else if ([target isKindOfClass:[UIViewController class]])
    {
        [self showFromView:((UIViewController *)target).view];
    }
    else
    {
        NBULogWarn(@"%@ can't be shown from '%@' target. Will show from key window instead.",
                   THIS_METHOD, NSStringFromClass([target class]));
        
        [self showFromView:[UIApplication sharedApplication].keyWindow];
    }
}

- (void)showFromView:(UIView *)view
{
    UIView * targetView = view;
    
    // iPhone? Try to use the topmost controller's view instead
    if (DEVICE_IS_IPHONE_IDIOM)
    {
        UIViewController * topmostController = view.viewController;
        
        if (topmostController.navigationController)
            topmostController = topmostController.navigationController;
        if (topmostController.tabBarController)
            topmostController = topmostController.tabBarController;
        
        targetView = topmostController.view;
    }
    
    [super showFromRect:targetView.bounds
                 inView:targetView
               animated:YES];
}

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

- (void)showFromRect:(CGRect)rect
              inView:(UIView *)view
            animated:(BOOL)animated
{
    self.delegate = self;
    
    [super showFromRect:rect
                 inView:view
               animated:animated];
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

- (void)showFromBarButtonItem:(UIBarButtonItem *)item
                     animated:(BOOL)animated
{
    self.delegate = self;
    
    [super showFromBarButtonItem:item
                        animated:animated];
}

#pragma mark - Delegate methods

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != self.cancelButtonIndex)
    {
        NSInteger selectedIndex = self.cancelButtonIndex == 0 ? buttonIndex - 1 : buttonIndex;
        
        NBULogVerbose(@"Selected button at index: %d", selectedIndex);
        
        if (_selectedButtonBlock) _selectedButtonBlock(selectedIndex);
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

