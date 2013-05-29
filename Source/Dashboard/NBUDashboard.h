//
//  NBUDashboard.h
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

@class NBUDashboardLogger;

/**
 Logger to display log messages on device.
 
 - Compatible with NBULog and DDLog.
 - Supports colors for log levels.
 - Expands and collapses text.
 
 To enable simply use [NBUDashboard sharedDashboard].hidden = NO.
 */
@interface NBUDashboard : UIWindow

+ (NBUDashboard *)sharedDashboard;

- (void)show;

/// @name Outlets

@property (strong, nonatomic) IBOutlet      NBUDashboardLogger * logger;

@property (assign, nonatomic) IBOutlet      UIButton * toggleButton;

/// Maximize/minimize the log dashboard.
/// @param sender The sender object.
- (IBAction)toggle:(id)sender;

@property (nonatomic, getter=isMaximized)   BOOL maximized;

@property (nonatomic, getter=isMinimized)   BOOL minimized;

@end

#endif

