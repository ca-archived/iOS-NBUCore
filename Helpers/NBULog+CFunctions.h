//
//  NBULog+CFunctions.h
//  NBUCore
//
//  Created by 利辺羅 on 2013/02/06.
//  Copyright (c) 2013年 CyberAgent Inc. All rights reserved.
//

/// Additional NBULog macros for C functions
#define NBULogCError(frmt, ...)  LOG_C_MAYBE(LOG_ASYNC_ERROR,   APP_LOG_LEVEL, LOG_FLAG_ERROR,    APP_LOG_CONTEXT + APP_MODULE, frmt, ##__VA_ARGS__)
#define NBULogCWarn(frmt, ...)   LOG_C_MAYBE(LOG_ASYNC_WARN,    APP_LOG_LEVEL, LOG_FLAG_WARN,     APP_LOG_CONTEXT + APP_MODULE, frmt, ##__VA_ARGS__)
#define NBULogCInfo(frmt, ...)   LOG_C_MAYBE(LOG_ASYNC_INFO,    APP_LOG_LEVEL, LOG_FLAG_INFO,     APP_LOG_CONTEXT + APP_MODULE, frmt, ##__VA_ARGS__)
#define NBULogCVerbose(frmt, ...)LOG_C_MAYBE(LOG_ASYNC_VERBOSE, APP_LOG_LEVEL, LOG_FLAG_VERBOSE,  APP_LOG_CONTEXT + APP_MODULE, frmt, ##__VA_ARGS__)
#define NBULogCTrace()           NBULogCVerbose(@"[%p] %@", self, THIS_METHOD)

