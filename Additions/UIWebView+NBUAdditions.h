//
//  UIWebView+NBUAdditions.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/09/25.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 UIWebView category to ease JavaScript calls.
 */
@interface UIWebView (NBUAdditions)

/// Access the HTML title.
@property (strong, nonatomic, readonly) NSString * title;

/// Access the User Agent.
@property (strong, nonatomic, readonly) NSString * userAgent;

/// @name Managing the Default User Agent.

/// The system's default user agent.
+ (NSString *)systemDefaultUserAgent;

/// Set the user agent to be used by all UIWebView requests.
/// @param userAgent The new default user agent.
+ (void)setDefaultUserAgent:(NSString *)userAgent;

/// @name Firing JavaScript events

/// Fire a Cordova JavaScript event.
/// @param event The event name.
- (void)fireEvent:(NSString *)event;

/// Fire a Cordova JavaScript event with an associated dictionary.
/// @param event The event name.
/// @param dictionary The associated NSDictionary.
- (void)fireEvent:(NSString *)event
   withDictionary:(NSDictionary *)dictionary;

@end

