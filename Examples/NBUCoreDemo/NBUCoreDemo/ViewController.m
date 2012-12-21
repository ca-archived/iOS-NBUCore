//
//  ViewController.m
//  NBUCoreDemo
//
//  Created by 利辺羅 on 2012/12/20.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize textView = _textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIApplication * application = [UIApplication sharedApplication];
    NSDictionary * properties = @{@"applicationName"      : application.applicationName,
                                  @"applicationVersion"   : application.applicationVersion,
                                  @"applicationBuild"     : application.applicationBuild,
                                  @"documentsDirectory"   : application.documentsDirectory.lastPathComponent,
                                  @"cachesDirectory"      : application.cachesDirectory.lastPathComponent};
    
    _textView.text = properties.description;
}

@end

