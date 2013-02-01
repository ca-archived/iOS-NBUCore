//
//  ConfigurationPickerViewController.m
//  NBUCoreDemo
//
//  Created by 利辺羅 on 2013/01/30.
//  Copyright (c) 2013年 CyberAgent Inc. All rights reserved.
//

#import "ConfigurationPickerViewController.h"

@implementation ConfigurationPickerViewController

@synthesize textView = _textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:NBUConfigurationChangedNotification
                                               object:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NBUConfigurationChangedNotification
                                                  object:nil];
}

- (IBAction)changeConfiguration:(UISegmentedControl *)sender
{
#ifndef PRODUCTION
    [MyConfigurationPicker show];
#endif
}

- (void)updateUI
{
    _textView.text = [NSString stringWithFormat:@"%@: %@\n%@: %@\n%@: %@\n%@: %@\n%@: %@\n%@: %@",
                      @"Current configuration", ConfigurationName,
                      @"Server",                ConnectionServer,
                      @"API server",            ConnectionAPIServer,
                      @"Protocol",              ConnectionProtocol,
                      @"Token",                 ConnectionToken,
                      @"Another parameter",     AnotherGlobalParameter];
}

@end

