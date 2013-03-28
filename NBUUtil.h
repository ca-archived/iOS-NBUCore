//
//  NBUUtil.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/12/07.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/// @name Macros

/// Detect system versions.
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/// Detect device idioms
#define DEVICE_IS_IPHONE_IDIOM  (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define DEVICE_IS_IPAD_IDIOM    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/// Detect "widescreen" devices (iPhone 5 or iPod Touch 4).
#define DEVICE_IS_WIDESCREEN (fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON)

/// @name Functions

/// Print descriptive BOOL: stringWithFormat:@"View is hidden: %@", NSStringFromBOOL(view.hidden).
static inline NSString * NSStringFromBOOL(BOOL yesOrNo)
{
    return yesOrNo ? @"YES" : @"NO";
}

/// Whether the application is being debugged.
extern BOOL AmIBeingDebugged(void);

