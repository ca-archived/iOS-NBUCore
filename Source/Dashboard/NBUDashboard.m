//
//  NBUDashboard.m
//  NBUCore
//
//  Created by Ernesto Rivera on 2012/12/17.
//  Copyright (c) 2012 CyberAgent Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#ifndef PRODUCTION

#import "NBUDashboard.h"
#import "NBUDashboardLogger.h"
#import <NBUCore/NBUCore.h>
#import <QuartzCore/QuartzCore.h>

#define kMinimumHeight 20.0

static NBUDashboard * _sharedDashboard;

@implementation NBUDashboard
{
    CGSize _screenSize;
}

@synthesize logger = _logger;
@synthesize toggleButton = _toggleButton;

+ (NBUDashboard *)sharedDashboard
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      CGRect frame = [UIScreen mainScreen].bounds;
//                      frame.size = CGSizeMake(20.0, 20.0);
                      _sharedDashboard = [[NBUDashboard alloc] initWithFrame:frame];
                  });
    return _sharedDashboard;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.windowLevel = UIWindowLevelStatusBar + 1;
        
        // Load other views and objects
        [NSBundle loadNibNamed:@"NBUDashboard"
                         owner:self
                       options:nil];
        
        // Add a pan gesture recognizer for the toggle button
        UIPanGestureRecognizer * panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(handlePanGesture:)];
        [_toggleButton addGestureRecognizer:panRecognizer];

        // Configure the window properties
        //    self.layer.anchorPoint = CGPointZero;
        //    self.windowLevel = UIWindowLevelStatusBar + 1;
        //    self.origin = CGPointZero;
        //    self.frame = [UIScreen mainScreen].bounds;
        
        // Listen to orientation changes
        //    [[NSNotificationCenter defaultCenter] addObserver:self
        //                                             selector:@selector(handleStatusBarOrientationChange:)
        //                                                 name:UIApplicationWillChangeStatusBarOrientationNotification
        //                                               object:nil];

    }
    return self;
}

- (void)dealloc
{
    // Stop observing
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)handleStatusBarOrientationChange:(NSNotification *)notification
{
    UIApplication * app = [UIApplication sharedApplication];
    UIInterfaceOrientation currentOrientation = app.statusBarOrientation;
    UIInterfaceOrientation nextOrientation = [notification.userInfo[UIApplicationStatusBarOrientationUserInfoKey] integerValue];
    
    // Flip the window's height and width?
    CGRect frame = self.frame;
    if ((UIDeviceOrientationIsLandscape(currentOrientation) && UIDeviceOrientationIsPortrait(nextOrientation)) ||
        (UIDeviceOrientationIsPortrait(currentOrientation) && UIDeviceOrientationIsLandscape(nextOrientation)))
    {
        frame.size = CGSizeMake(frame.size.height,
                                frame.size.width);
    }
    
    // Calculate the transform and origin
    CGAffineTransform transform;
    switch (nextOrientation)
    {
        case UIInterfaceOrientationPortrait:
            frame.origin = CGPointZero;
            transform = CGAffineTransformIdentity;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            frame.origin = CGPointMake(0.0, _screenSize.height);
            transform = CGAffineTransformMakeRotation(- M_PI / 2.0);
            break;
        case UIInterfaceOrientationLandscapeRight:
            frame.origin = CGPointMake(_screenSize.width, 0.0);
            transform = CGAffineTransformMakeRotation(M_PI / 2.0);
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            frame.origin = CGPointMake(_screenSize.width, _screenSize.height);
            transform = CGAffineTransformMakeRotation(M_PI);
            break;
        default:
            break;
    }
    
//    NSLog(@"+++ %@ %@ -> %@ %@", NSStringFromCGRect(self.frame), NSStringFromCGAffineTransform(self.transform),
//          NSStringFromCGRect(frame), NSStringFromCGAffineTransform(transform));
    
    // Animate
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    [UIView animateWithDuration:duration
                     animations:^
    {
        self.transform = transform;
        self.frame = frame;
    }];
}

- (void)show
{
    self.hidden = NO;
    [self setWindowHeight:kMinimumHeight];
}

- (IBAction)toggle:(id)sender
{
    _toggleButton.selected = !_toggleButton.selected;
    
    [UIView animateWithDuration:0.2
                     animations:^
     {
         [self setWindowHeight:_toggleButton.selected ? [UIApplication sharedApplication].keyWindow.size.height : kMinimumHeight];
     }];
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    [self setWindowHeight:[gestureRecognizer locationInView:self].y];
}

- (void)setWindowHeight:(CGFloat)height
{
    // Validate height
    height = MAX(kMinimumHeight, height);
    CGSize size = [UIScreen mainScreen].bounds.size;
    if (size.height > 0 &&
        size.height - height < kMinimumHeight * 2.0)
    {
        // Snap to bottom
        height = size.height;
    }
    
    // Adjust layout
    if (height != kMinimumHeight)
    {
        // Not minimized
        _logger.tableView.userInteractionEnabled = YES;
        _logger.tableView.frame = _logger.tableView.superview.bounds;
        self.size = CGSizeMake(size.width,
                               height);
    }
    else
    {
        // Minimized
        _logger.tableView.userInteractionEnabled = NO;
        CGRect tableFrame = _logger.tableView.superview.bounds;
        tableFrame.origin.x += 20.0;
        tableFrame.size.width -= 20.0;
        _logger.tableView.frame = tableFrame;
        _logger.tableView.contentOffset = CGPointMake(0.0,
                                                      MAX(_logger.tableView.contentOffset.y,
                                                          _logger.tableView.tableHeaderView.size.height));
        self.size = CGSizeMake(size.width - 40.0,
                               height);
    }
}

@end

#endif

