//
//  LogTestsViewController.h
//  NBUCoreDemo
//
//  Created by 利辺羅 on 2012/12/20.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogTestsViewController : UIViewController

// Outlets
@property (assign, nonatomic) IBOutlet UITextView * textView;

// Actions
- (IBAction)changeLogLevel:(id)sender;
- (IBAction)testTrace:(id)sender;
- (IBAction)testVerbose:(id)sender;
- (IBAction)testInfo:(id)sender;
- (IBAction)testWarn:(id)sender;
- (IBAction)testError:(id)sender;

@end
