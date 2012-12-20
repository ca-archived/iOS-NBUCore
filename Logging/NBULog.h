//
//  NBULog.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/12/06.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "DDLog.h"

/// Extensible default contexts
#define APP_LOG_CONTEXT     0

/// Dynamic levels
#define APP_LOG_LEVEL   [NBULog appLogLevel]

/// Only keep NSLogs for debug builds
#ifndef DEBUG
    #define NSLog(...)
#endif

/// Redefine (#undef ... #define ...) this for your own custom modules' prefix file
/// @see NBUKit-Prefix.pch
#define NBULogError(frmt, ...)  LOG_OBJC_MAYBE(LOG_ASYNC_ERROR,   APP_LOG_LEVEL, LOG_FLAG_ERROR,    APP_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define NBULogWarn(frmt, ...)   LOG_OBJC_MAYBE(LOG_ASYNC_WARN,    APP_LOG_LEVEL, LOG_FLAG_WARN,     APP_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define NBULogInfo(frmt, ...)   LOG_OBJC_MAYBE(LOG_ASYNC_INFO,    APP_LOG_LEVEL, LOG_FLAG_INFO,     APP_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define NBULogVerbose(frmt, ...)LOG_OBJC_MAYBE(LOG_ASYNC_VERBOSE, APP_LOG_LEVEL, LOG_FLAG_VERBOSE,  APP_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define NBULogTrace()           NBULogVerbose(@"[%p] %@", self, THIS_METHOD)

/**
 A simple class used to set/get App log levels for debug or testing builds.
 
 Default configuration (can be dynamically changed):
 
 - AppLogLevel: `LOG_LEVEL_VERBOSE` for `DEBUG`, `LOG_LEVEL_INFO` otherwise.
 - Loggers: DDTTYLogger for `DEBUG`, DDFileLogger otherwise.
 
 Manually add NBUDashboardLogger or DDASLLogger if desired.
 
 To add other modules just create a NBULog category.
 */
@interface NBULog : NSObject

/// @name Adjusting Log Levels

// Dynamically set the App log level.
+ (void)setAppLogLevel:(int)LOG_LEVEL_XXX;

// Get the App log level.
+ (int)appLogLevel;

/// @name Adding Loggers

/// Configure and add a NBUDashboardLogger.
+ (void)addDashboardLogger;

/// Configure ad add a DDASLLogger. Not needed in most cases.
+ (void)addASLLogger;

@end

