//
//  UIWebView+NBUAdditions.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/09/25.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "UIWebView+NBUAdditions.h"

// Set Logging Component
#undef RKLogComponent
#define RKLogComponent lcl_cBaseGap

static NSString * _systemDefaultUserAgent;

@implementation UIWebView (NBUAdditions)

+ (NSString *)systemDefaultUserAgent
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIWebView * tmpWebView = [UIWebView new];
        _systemDefaultUserAgent = tmpWebView.userAgent;
    });
    return _systemDefaultUserAgent;
}

+ (void)setDefaultUserAgent:(NSString *)userAgent
{
    NBULogVerbose(@"setDefaultUserAgent: %@", userAgent);
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent" : userAgent}];
}

- (NSString *)title
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (NSString *)userAgent
{
    return [self stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
}

- (void)fireEvent:(NSString *)event
{
    NBULogVerbose(@"fireEvent: %@", event);
    
    [self stringByEvaluatingJavaScriptFromString:
     [NSString stringWithFormat:@"try{cordova.fireDocumentEvent('%@');}catch(e){console.log('Exception firing %@ event');};",
      event, event]];
}

- (void)fireEvent:(NSString *)event
   withDictionary:(NSDictionary *)dictionary
{
    NBULogVerbose(@"fireEvent: %@ withDictionary: %@", event, dictionary);
    
    [self stringByEvaluatingJavaScriptFromString:
     [NSString stringWithFormat:@"try{cordova.fireDocumentEvent('%@',%@);}catch(e){console.log('Exception firing %@ event');};",
      event, [self convertToJavaScriptDictionary:dictionary], event]];
}

- (NSString *)convertToJavaScriptDictionary:(NSDictionary *)dictionary
{
    return [[[dictionary description]
             stringByReplacingOccurrencesOfString:@"=" withString:@":"]
            stringByReplacingOccurrencesOfString:@";" withString:@","];
}

@end

