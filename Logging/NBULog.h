//
//  NBULog.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/12/06.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "DDLog.h"

/// Extensible default contexts
#define APP_LOG_CONTEXT 0

/// Dynamic levels  for debug or testing builds.
#if defined (DEBUG) || defined (TESTING)
    // In debug modes change the log level with NBULog methods
    #define APP_LOG_LEVEL   [NBULog appLogLevel]
#else
    // In final modes log levels are fixed
    #define APP_LOG_LEVEL LOG_LEVEL_WARN
#endif

/// Use NBULogVerbose for remaining NSLog messages
#ifndef DEBUG
    #define NSLog NBULogVerbose
#endif

/// Undef and define this for your own custom modules' prefix file
/// @see NBUKit-Prefix.pch
#define NBULogError(frmt, ...)  LOG_OBJC_MAYBE(LOG_ASYNC_ERROR,   APP_LOG_LEVEL, LOG_FLAG_ERROR,    APP_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define NBULogWarn(frmt, ...)   LOG_OBJC_MAYBE(LOG_ASYNC_WARN,    APP_LOG_LEVEL, LOG_FLAG_WARN,     APP_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define NBULogInfo(frmt, ...)   LOG_OBJC_MAYBE(LOG_ASYNC_INFO,    APP_LOG_LEVEL, LOG_FLAG_INFO,     APP_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define NBULogVerbose(frmt, ...)LOG_OBJC_MAYBE(LOG_ASYNC_VERBOSE, APP_LOG_LEVEL, LOG_FLAG_VERBOSE,  APP_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define NBULogTrace()           NBULogVerbose(@"[%p] %@", self, THIS_METHOD)

/**
 A simple class used to set/get App log levels for debug or testing builds.
 
 - To add other modules just create a NBULog category.
 
 @note Builds without the `DEBUG` or `TESTING` defined have fixed log levels.
 */
@interface NBULog : NSObject

// Dynamically set the App log level for debug or testing builds.
+ (void)setAppLogLevel:(int)LOG_LEVEL;

// Get the App log level for debug or testing builds.
+ (int)appLogLevel;

@end

