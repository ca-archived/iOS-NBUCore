//
//  NBUUtil.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/12/07.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/// Detect system versions
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/// Detect "widescreen" devices (iPhone 5 or iPod Touch v4)
#define DEVICE_IS_WIDESCREEN (fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON)

/// Print descriptive BOOL: stringWithFormat:@"View is hidden: %@", NSStringFromBOOL(view.hidden)
#define NSStringFromBOOL(bool) (bool ? @"YES" : @"NO")

