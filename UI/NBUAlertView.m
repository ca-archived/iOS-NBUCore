//
//  NBUAlertView.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/10/31.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "NBUAlertView.h"

// Private category
@interface NBUAlertView (Private) <UIAlertViewDelegate>

@end


@implementation NBUAlertView

@synthesize selectedButtonBlock = _selectedButtonBlock;
@synthesize cancelButtonBlock = _cancelButtonBlock;

- (void)setDelegate:(id<UIAlertViewDelegate>)delegate
{
    if (delegate && delegate != self)
    {
        NBULogWarn(@"Delegate '%@' will be ignored. Set selectedButtonBlock and/or cancelButtonBlock instead.",
                     delegate);
    }
    super.delegate = self;
}

- (void)show
{
    self.delegate = self;
    
    [super show];
}

#pragma mark - Delegate methods

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != self.cancelButtonIndex)
    {
        NBULogVerbose(@"Selected button at index: %d", buttonIndex);
        if (_selectedButtonBlock) _selectedButtonBlock(buttonIndex);
    }
    else
    {
        NBULogVerbose(@"Canceled");
        if (_cancelButtonBlock) _cancelButtonBlock();
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    NBULogTrace();
    
    if (_cancelButtonBlock) _cancelButtonBlock();
}

@end

