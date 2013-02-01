//
//  MyConfigurationPicker.h
//  NBUCoreDemo
//
//  Created by 利辺羅 on 2013/01/30.
//  Copyright (c) 2013年 CyberAgent Inc. All rights reserved.
//

// *** Check NBUCoreDemo-Prefix.pch ***

#ifndef PRODUCTION

// *** You need your own NBUConfigurationPicker subclass! ***
@interface MyConfigurationPicker : NBUConfigurationPicker

// Your project configuration parameters
+ (NSString *)server;
+ (NSString *)apiServer;
+ (NSString *)protocol;
+ (NSString *)token;
+ (NSArray *)anotherParameter;

@end

#endif

